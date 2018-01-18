# Results (@@JOB_BASE_NAME@@ #@@BUILD_NUMBER@@ @@TIMESTAMP@@)
## Summary
The following tables show the final results taken and computed from a single test run - i.e. after and by running the login phase and the 5 minutes of the load phase.

The summary results of each run are uploaded to the
[Zabbix](https://zabbix.devshift.net:9443/zabbix/charts.php?fullscreen=1&graphid=TODO:Fill_in_graph_id)
monitoring system to track the results' history.

### Load Test
| Scenario | Minimal | Median | Maximal | Average | Failed |
| :--- | ---: | ---: | ---: | ---: | ---: |
|`pushmetric_light_payload`| @@PUSHMETRIC_LIGHT_PAYLOAD_MIN@@ ms | @@PUSHMETRIC_LIGHT_PAYLOAD_MEDIAN@@ ms | @@PUSHMETRIC_LIGHT_PAYLOAD_MAX@@ ms | @@PUSHMETRIC_LIGHT_PAYLOAD_AVERAGE@@ ms | @@PUSHMETRIC_LIGHT_PAYLOAD_FAILED@@ |
|`pushmetric_med_payload`| @@PUSHMETRIC_MED_PAYLOAD_MIN@@ ms | @@PUSHMETRIC_MED_PAYLOAD_MEDIAN@@ ms | @@PUSHMETRIC_MED_PAYLOAD_MAX@@ ms | @@PUSHMETRIC_MED_PAYLOAD_AVERAGE@@ ms | @@PUSHMETRIC_MED_PAYLOAD_FAILED@@ |
|`pushmetric_heavy_payload`| @@PUSHMETRIC_HEAVY_PAYLOAD_MIN@@ ms | @@PUSHMETRIC_HEAVY_PAYLOAD_MEDIAN@@ ms | @@PUSHMETRIC_HEAVY_PAYLOAD_MAX@@ ms | @@PUSHMETRIC_HEAVY_PAYLOAD_AVERAGE@@ ms | @@PUSHMETRIC_HEAVY_PAYLOAD_FAILED@@ |

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
![pushmetric_light_payload-reponse-time](./@@JOB_BASE_NAME@@-@@BUILD_NUMBER@@-POST_pushmetric_light_payload-response-time.png)
![pushmetric_light_payload-minimal-reponse-time](./@@JOB_BASE_NAME@@-@@BUILD_NUMBER@@-POST_pushmetric_light_payload-minimal-response-time.png)
![pushmetric_light_payload-median-reponse-time](./@@JOB_BASE_NAME@@-@@BUILD_NUMBER@@-POST_pushmetric_light_payload-median-response-time.png)
![pushmetric_light_payload-maximal-reponse-time](./@@JOB_BASE_NAME@@-@@BUILD_NUMBER@@-POST_pushmetric_light_payload-maximal-response-time.png)
![pushmetric_light_payload-average-reponse-time](./@@JOB_BASE_NAME@@-@@BUILD_NUMBER@@-POST_pushmetric_light_payload-average-response-time.png)
#### `pushmetric_light_payload` Failures
![pushmetric_light_payload-failures](./@@JOB_BASE_NAME@@-@@BUILD_NUMBER@@-POST_pushmetric_light_payload-failures.png)
#### `pushmetric_med_payload` Response Time
![pushmetric_med_payload-refresh-time](./@@JOB_BASE_NAME@@-@@BUILD_NUMBER@@-POST_pushmetric_med_payload-response-time.png)
![pushmetric_med_payload-minimal-refresh-time](./@@JOB_BASE_NAME@@-@@BUILD_NUMBER@@-POST_pushmetric_med_payload-minimal-response-time.png)
![pushmetric_med_payload-median-refresh-time](./@@JOB_BASE_NAME@@-@@BUILD_NUMBER@@-POST_pushmetric_med_payload-median-response-time.png)
![pushmetric_med_payload-maximal-refresh-time](./@@JOB_BASE_NAME@@-@@BUILD_NUMBER@@-POST_pushmetric_med_payload-maximal-response-time.png)
![pushmetric_med_payload-average-refresh-time](./@@JOB_BASE_NAME@@-@@BUILD_NUMBER@@-POST_pushmetric_med_payload-average-response-time.png)
#### `pushmetric_med_payload` Failures
![pushmetric_med_payload-failures](./@@JOB_BASE_NAME@@-@@BUILD_NUMBER@@-POST_pushmetric_med_payload-failures.png)
#### `pushmetric_heavy_payload` Response Time
![pushmetric_heavy_payload-reponse-time](./@@JOB_BASE_NAME@@-@@BUILD_NUMBER@@-POST_pushmetric_heavy_payload-response-time.png)
![pushmetric_heavy_payload-minimal-reponse-time](./@@JOB_BASE_NAME@@-@@BUILD_NUMBER@@-POST_pushmetric_heavy_payload-minimal-response-time.png)
![pushmetric_heavy_payload-median-reponse-time](./@@JOB_BASE_NAME@@-@@BUILD_NUMBER@@-POST_pushmetric_heavy_payload-median-response-time.png)
![pushmetric_heavy_payload-maximal-reponse-time](./@@JOB_BASE_NAME@@-@@BUILD_NUMBER@@-POST_pushmetric_heavy_payload-maximal-response-time.png)
![pushmetric_heavy_payload-average-reponse-time](./@@JOB_BASE_NAME@@-@@BUILD_NUMBER@@-POST_pushmetric_heavy_payload-average-response-time.png)
#### `pushmetric_heavy_payload` Failures
![pushmetric_heavy_payload-failures](./@@JOB_BASE_NAME@@-@@BUILD_NUMBER@@-POST_pushmetric_heavy_payload-failures.png)