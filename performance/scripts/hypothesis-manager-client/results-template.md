# Results (@@JOB_BASE_NAME@@ #@@BUILD_NUMBER@@ @@TIMESTAMP@@)
## Summary
The following tables show the final results taken and computed from a single test run - i.e. after and by running the login phase and the 5 minutes of the load phase.

The summary results of each run are uploaded to the
[Zabbix](https://zabbix.devshift.net:9443/zabbix/charts.php?fullscreen=1&graphid=TODO:Fill_in_graph_id)
monitoring system to track the results' history.

### Load Test
| Scenario | Minimal | Median | Maximal | Average | Failed |
| :--- | ---: | ---: | ---: | ---: | ---: |
|`fetch_experiment`| @@FETCH_EXPERIMENT_MIN@@ ms | @@FETCH_EXPERIMENT_MEDIAN@@ ms | @@FETCH_EXPERIMENT_MAX@@ ms | @@FETCH_EXPERIMENT_AVERAGE@@ ms | @@FETCH_EXPERIMENT_FAILED@@ |

## Test charts
The charts bellow show the whole duration of all the phases for each scenario - i.e. what lead to the final results shown above in the summary.

### Prepare Test
The following charts show the respective times of UI of each test user as they were logged in one by one.
So the first value in the chart is for the first user, the second value is for the second user and so on.

### Load Test
In these charts, the value shown in each point of time is the metric (minimal, median, maximal and average value) of the response time
computed for a time window from the start to the respective point of time. So it is a floating metric.

That is the reason for the values of the maximals always go up.
#### `pushmetric_light_payload` Response Time
![fetch_experiment-reponse-time](./@@JOB_BASE_NAME@@-@@BUILD_NUMBER@@-GET_fetch_experiment-response-time.png)
![fetch_experiment-minimal-reponse-time](./@@JOB_BASE_NAME@@-@@BUILD_NUMBER@@-GET_fetch_experiment-minimal-response-time.png)
![fetch_experiment-median-reponse-time](./@@JOB_BASE_NAME@@-@@BUILD_NUMBER@@-GET_fetch_experiment-median-response-time.png)
![fetch_experiment-maximal-reponse-time](./@@JOB_BASE_NAME@@-@@BUILD_NUMBER@@-GET_fetch_experiment-maximal-response-time.png)
![fetch_experiment-average-reponse-time](./@@JOB_BASE_NAME@@-@@BUILD_NUMBER@@-GET_fetch_experiment-average-response-time.png)
![fetch_experiment-rt-histo](./@@JOB_BASE_NAME@@-@@BUILD_NUMBER@@-GET_fetch_experiment-rt-histo.png)
#### `pushmetric_light_payload` Failures
![fetch_experiment-failures](./@@JOB_BASE_NAME@@-@@BUILD_NUMBER@@-GET_fetch_experiment-failures.png)