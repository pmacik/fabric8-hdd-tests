from locust import HttpLocust, TaskSet, task

serverScheme = "@@SERVER_SCHEME@@"
serverHost = "@@SERVER_HOST@@"

heavy_payload1 = {
		"scout_id" : "a4e1b0cf-2a08-4297-83f3-4db896d7e0fb",
		"data" : [{"date":"1/1/2", "value":1234}],
		"source": {
					"date": "2018-02-12 12:05:45:999 pm"
		},
		"descriptor": {
			"id": 1234,
			"unit_of_measure": "seconds"
		},
		"dimensions": {
			"node": 3,
			"pod": 1234,
			"container": 223434
		}
	}

class ScoutTaskSet(TaskSet):
	def __pushmetric(self, payload, name):
		response = self.client.post("/api/v1.0/measurements", payload, name=name ,catch_response=True)
		content = response.content

		try:
			if not response.ok:
				response.failure("Got wrong response: [" + content + "]")
			else:
				response.success()
		except ValueError:
			response.failure("Got wrong response EXCEPTIONN!: [" + content + "]")

	@task(10)
		def pushmetric_light_payload(self):
		self.__pushmetric({ "hello": "world" }, "pushmetric_light_payload")

	@task(10)
	def pushmetric_heavy_payload(self):
		self.__pushmetric(heavy_payload1, "pushmetric_heavy_payload")

class MyLocust(HttpLocust):
	task_set = ScoutTaskSet
	host = serverScheme + "://" + serverHost
	min_wait=1000
	max_wait=10000