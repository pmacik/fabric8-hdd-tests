# Results (@@JOB_BASE_NAME@@ #@@BUILD_NUMBER@@ @@TIMESTAMP@@)
## Summary
The following tables show the final results taken and computed from a single test run - i.e. after and by running the login phase and the 5 minutes of the load phase.

The summary results of each run are uploaded to the
[Zabbix](https://zabbix.devshift.net:9443/zabbix/charts.php?fullscreen=1&graphid=8575)
monitoring system to track the results' history.


### Load Test
| Scenario | Minimal | Median | Maximal | Average | Failed |
| :--- | ---: | ---: | ---: | ---: | ---: |
|`auth-api-user`| @@AUTH_API_USER_MIN@@ ms | @@AUTH_API_USER_MEDIAN@@ ms | @@AUTH_API_USER_MAX@@ ms | @@AUTH_API_USER_AVERAGE@@ ms | @@AUTH_API_USER_FAILED@@ |
|`auth-api-token-refresh`| @@AUTH_API_TOKEN_REFRESH_MIN@@ ms | @@AUTH_API_TOKEN_REFRESH_MEDIAN@@ ms | @@AUTH_API_TOKEN_REFRESH_MAX@@ ms | @@AUTH_API_TOKEN_REFRESH_AVERAGE@@ ms | @@AUTH_API_TOKEN_REFRESH_FAILED@@ |
|`auth-api-user-github-token`| @@AUTH_API_USER_GITHUB_TOKEN_MIN@@ ms | @@AUTH_API_USER_GITHUB_TOKEN_MEDIAN@@ ms | @@AUTH_API_USER_GITHUB_TOKEN_MAX@@ ms | @@AUTH_API_USER_GITHUB_TOKEN_AVERAGE@@ ms | @@AUTH_API_USER_GITHUB_TOKEN_FAILED@@ |

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
![pushmetric_light_payload-reponse-time](./@@JOB_BASE_NAME@@-@@BUILD_NUMBER@@-GET_auth-api-user-response-time.png)
![pushmetric_light_payload-minimal-reponse-time](./@@JOB_BASE_NAME@@-@@BUILD_NUMBER@@-GET_auth-api-user-minimal-response-time.png)
![pushmetric_light_payload-median-reponse-time](./@@JOB_BASE_NAME@@-@@BUILD_NUMBER@@-GET_auth-api-user-median-response-time.png)
![pushmetric_light_payload-maximal-reponse-time](./@@JOB_BASE_NAME@@-@@BUILD_NUMBER@@-GET_auth-api-user-maximal-response-time.png)
![pushmetric_light_payload-average-reponse-time](./@@JOB_BASE_NAME@@-@@BUILD_NUMBER@@-GET_auth-api-user-average-response-time.png)
#### `pushmetric_light_payload` Failures
![pushmetric_light_payload-failures](./@@JOB_BASE_NAME@@-@@BUILD_NUMBER@@-GET_auth-api-user-failures.png)
#### `pushmetric_med_payload` Response Time
![pushmetric_med_payload-refresh-time](./@@JOB_BASE_NAME@@-@@BUILD_NUMBER@@-POST_auth-api-token-refresh-response-time.png)
![pushmetric_med_payload-minimal-refresh-time](./@@JOB_BASE_NAME@@-@@BUILD_NUMBER@@-POST_auth-api-token-refresh-minimal-response-time.png)
![pushmetric_med_payload-median-refresh-time](./@@JOB_BASE_NAME@@-@@BUILD_NUMBER@@-POST_auth-api-token-refresh-median-response-time.png)
![pushmetric_med_payload-maximal-refresh-time](./@@JOB_BASE_NAME@@-@@BUILD_NUMBER@@-POST_auth-api-token-refresh-maximal-response-time.png)
![pushmetric_med_payload-average-refresh-time](./@@JOB_BASE_NAME@@-@@BUILD_NUMBER@@-POST_auth-api-token-refresh-average-response-time.png)
#### `pushmetric_med_payload` Failures
![pushmetric_med_payload-failures](./@@JOB_BASE_NAME@@-@@BUILD_NUMBER@@-POST_auth-api-token-refresh-failures.png)
#### `pushmetric_heavy_payload` Response Time
![pushmetric_heavy_payload-reponse-time](./@@JOB_BASE_NAME@@-@@BUILD_NUMBER@@-GET_auth-api-user-github-token-response-time.png)
![pushmetric_heavy_payload-minimal-reponse-time](./@@JOB_BASE_NAME@@-@@BUILD_NUMBER@@-GET_auth-api-user-github-token-minimal-response-time.png)
![pushmetric_heavy_payload-median-reponse-time](./@@JOB_BASE_NAME@@-@@BUILD_NUMBER@@-GET_auth-api-user-github-token-median-response-time.png)
![pushmetric_heavy_payload-maximal-reponse-time](./@@JOB_BASE_NAME@@-@@BUILD_NUMBER@@-GET_auth-api-user-github-token-maximal-response-time.png)
![pushmetric_heavy_payload-average-reponse-time](./@@JOB_BASE_NAME@@-@@BUILD_NUMBER@@-GET_auth-api-user-github-token-average-response-time.png)
#### `pushmetric_heavy_payload` Failures
![pushmetric_heavy_payload-failures](./@@JOB_BASE_NAME@@-@@BUILD_NUMBER@@-GET_auth-api-user-github-token-failures.png)