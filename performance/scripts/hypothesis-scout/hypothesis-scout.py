from locust import HttpLocust, TaskSet, task

serverScheme = "@@SERVER_SCHEME@@"
serverHost = "@@SERVER_HOST@@"

med_payload1 = {
	"id": "0001",
	"type": "donut",
	"name": "Cake",
	"ppu": 0.55,
	"batters":
		{
			"batter":
				[
					{ "id": "1001", "type": "Regular" },
					{ "id": "1002", "type": "Chocolate" },
					{ "id": "1003", "type": "Blueberry" },
					{ "id": "1004", "type": "Devil's Food" }
				]
		},
	"topping":
		[
			{ "id": "5001", "type": "None" },
			{ "id": "5002", "type": "Glazed" },
			{ "id": "5005", "type": "Sugar" },
			{ "id": "5007", "type": "Powdered Sugar" },
			{ "id": "5006", "type": "Chocolate with Sprinkles" },
			{ "id": "5003", "type": "Chocolate" },
			{ "id": "5004", "type": "Maple" }
		]
}

class ScoutTaskSet(TaskSet):

    def __pushmetric(self, payload, name):
        response = self.client.post("/api/v1.0/stats", payload, name=name ,catch_response=True)
    	content = response.content

    	try:
			if not response.ok:
				response.failure("Got wrong response: [" + content + "]")
			else:
				response.success()
    	except ValueError:
			response.failure("Got wrong response EXCEEEEPTIONN!: [" + content + "]")

    @task(3)
    def pushmetric_light_payload(self):
		self.__pushmetric({ "hello": "world" }, "pushmetric_light_payload")

    @task(3)
    def pushmetric_med_payload(self):
        self.__pushmetric(med_payload1, "pushmetric_med_payload")

    @task(3)
    def pushmetric_heavy_payload(self):
        self.__pushmetric({ "hello": "world" }, name="pushmetric_heavy_payload")

class MyLocust(HttpLocust):
    task_set = ScoutTaskSet
    host = serverScheme + "://" + serverHost
    min_wait=1000
    max_wait=10000