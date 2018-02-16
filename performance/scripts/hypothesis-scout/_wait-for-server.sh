#!/bin/bash

source _setenv.sh

NOW=`date +%s`
STOP=`expr $NOW + 60`

while [ `date +%s` -lt $STOP ];
do
   echo "Checking if the server is up and running ..."
   curl --silent $SERVER_SCHEME://$SERVER_HOST/api/v1.0/liveness
   if [[ $? -eq 0 ]]; then
     response_code=`curl -i --silent $SERVER_SCHEME://$SERVER_HOST/api/v1.0/readiness | head -n 1 | cut -d " " -f2`;
     if [[ "$response_code" -eq "200" ]]; then
       echo "The server is ready."
       exit 0;
     else
       echo "The server is not ready - responding by $response_code code.";
     fi;
   else
     echo "The server is not responding.";
   fi
   echo "Trying again after 10s.";
   sleep 10;
done

exit 1