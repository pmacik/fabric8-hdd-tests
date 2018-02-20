#!/bin/bash

source _setenv.sh

export COMMON="common.git"
git clone https://github.com/pmacik/openshiftio-performance-common $COMMON

echo " Wait for the server to become available"
./_wait-for-server.sh
if [ $? -gt 0 ]; then
	exit 1
fi

echo " Prepare locustfile template"
./_prepare-locustfile.sh hypothesis-manager-client.py

touch $ENV_FILE-master

if [ "$RUN_LOCALLY" != "true" ]; then
	echo " Shut Locust master down"
	$COMMON/__stop-locust-master.sh

	echo " Start Locust master waiting for slaves"
	$COMMON/__start-locust-master.sh
else
	echo " Shut Locust master down"
	$COMMON/__stop-locust-master-standalone.sh
	echo " Run Locust locally"
	$COMMON/__start-locust-master-standalone.sh
fi

echo " Run test for $DURATION seconds"
sleep $DURATION

if [ "$RUN_LOCALLY" != "true" ]; then
	echo " Shut Locust master down"
	$COMMON/__stop-locust-master.sh TERM

	echo " Download locust reports from Locust master"
	$COMMON/_gather-locust-reports.sh
else
	$COMMON/__stop-locust-master-standalone.sh TERM
fi

echo " Extract CSV data from logs"
$COMMON/_locust-log-to-csv.sh 'GET fetch_experiment' $JOB_BASE_NAME-$BUILD_NUMBER-locust-master.log

echo " Generate charts from CSV"
export REPORT_CHART_WIDTH=1000
export REPORT_CHART_HEIGHT=600
for c in $(find *.csv | grep '\-POST_\+\|\-GET_\+'); do echo $c; $COMMON/_csv-response-time-to-png.sh $c; $COMMON/_csv-throughput-to-png.sh $c; $COMMON/_csv-failures-to-png.sh $c; done
function distribution_2_csv {
	HEAD=(`cat $1 | head -n 1 | sed -e 's,",,g' | sed -e 's, ,_,g' | sed -e 's,%,,g' | tr "," " "`)
	DATA=(`cat $1 | grep -F "$2" | sed -e 's,",,g' | sed -e 's, ,_,g' | tr "," " "`)
	NAME=`echo $1 | sed -e 's,-report_distribution,,g' | sed -e 's,\.csv,,g'`-`echo "$2" | sed -e 's,",,g' | sed -e 's, ,_,g;'`

	rm -rf $NAME-rt-histo.csv;
	for i in $(seq 2 $(( ${#HEAD[*]} - 1 )) ); do
		echo "${HEAD[$i]};${DATA[$i]}" >> $NAME-rt-histo.csv;
	done;
}
for c in $(find *.csv | grep '\-report_distribution.csv'); do
	distribution_2_csv $c '"GET fetch_experiment"';
done
for c in $(find *rt-histo.csv); do echo $c; $COMMON/_csv-rt-histogram-to-png.sh $c; done

echo " Prepare results for Zabbix"
rm -rvf *-zabbix.log

./_zabbix-process-results.sh $JOB_BASE_NAME-$BUILD_NUMBER '"GET","fetch_experiment"' "fetch_experiment"

ZABBIX_LOG=$JOB_BASE_NAME-$BUILD_NUMBER-zabbix.log
if [[ "$ZABBIX_REPORT_ENABLED" = "true" ]]; then
	echo "  Uploading report to zabbix...";
	zabbix_sender -vv -i $ZABBIX_LOG -T -z $ZABBIX_SERVER -p $ZABBIX_PORT;
fi

RESULTS_FILE=$JOB_BASE_NAME-$BUILD_NUMBER-results.md
sed -e "s,@@JOB_BASE_NAME@@,$JOB_BASE_NAME,g" results-template.md |
sed -e "s,@@BUILD_NUMBER@@,$BUILD_NUMBER,g" > $RESULTS_FILE

# Create HTML report
function filterZabbixValue {
   VALUE=`cat $1 | grep $2 | head -n 1 | cut -d " " -f 4`
   sed -i -e "s,$3,$VALUE,g" $4
}

filterZabbixValue $ZABBIX_LOG "fetch_experiment-rt_min" "@@FETCH_EXPERIMENT_MIN@@" $RESULTS_FILE;
filterZabbixValue $ZABBIX_LOG "fetch_experiment-rt_median" "@@FETCH_EXPERIMENT_MEDIAN@@" $RESULTS_FILE;
filterZabbixValue $ZABBIX_LOG "fetch_experiment-rt_max" "@@FETCH_EXPERIMENT_MAX@@" $RESULTS_FILE;
filterZabbixValue $ZABBIX_LOG "fetch_experiment-rt_average" "@@FETCH_EXPERIMENT_AVERAGE@@" $RESULTS_FILE;
filterZabbixValue $ZABBIX_LOG "fetch_experiment-failed" "@@FETCH_EXPERIMENT_FAILED@@" $RESULTS_FILE;

REPORT_TIMESTAMP=`date '+%Y-%m-%d %H:%M:%S (%Z)'`
sed -i -e "s,@@TIMESTAMP@@,$REPORT_TIMESTAMP,g" $RESULTS_FILE

REPORT_FILE=$JOB_BASE_NAME-report.md
cat README.md $RESULTS_FILE > $REPORT_FILE
if [ -z "$GRIP_USER" ]; then
	grip --export $REPORT_FILE
else
	grip --user=$GRIP_USER --pass=$GRIP_PASS --export $REPORT_FILE
fi

echo " Check for errors in Locust master log"
if [[ "0" -ne `cat $JOB_BASE_NAME-$BUILD_NUMBER-locust-master.log | grep 'Error report' | wc -l` ]]; then echo '[:(] THERE WERE ERRORS OR FAILURES!!!'; else echo '[:)] NO ERRORS OR FAILURES DETECTED.'; fi
