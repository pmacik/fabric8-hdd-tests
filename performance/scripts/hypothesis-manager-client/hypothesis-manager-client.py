import json

from locust import HttpLocust, TaskSet, task

serverScheme = "@@SERVER_SCHEME@@"
serverHost = "@@SERVER_HOST@@"


class ManagerClientTaskSet(TaskSet):

	@task
	def __get_experiment(self):
		experiment_id = "4a55d709-b076-4064-bacd-cbf212b9e3cb"
		response = self.client.get("/api/v1.0/experiments/" + experiment_id, name="fetch_experiment", catch_response=True)
		content = response.content

		try:
			if not response.ok:
				response.failure("Got wrong response: [" + content + "]")
			else:
				response_obj = json.loads(content)
				if response_obj["id"] == experiment_id:
					response.success()
				else:
					response.failure("Got wrong response: [" + content + "]")
		except ValueError:
			response.failure("Got wrong response EXCEPTIONN!: [" + content + "]")


class MyLocust(HttpLocust):
	task_set = ManagerClientTaskSet
	host = serverScheme + "://" + serverHost
	min_wait = 1000
	max_wait = 1000
