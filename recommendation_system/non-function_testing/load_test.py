from locust import HttpUser, SequentialTaskSet, task, between


class MyTaskSet(SequentialTaskSet):
    @task
    def my_task(self):
        res = self.client.get("/")
        print("Get method status is ", res.status_code)


class MyLocust(HttpUser):
    wait_time = between(1, 5)
    host = "http://localhost/pythonProject"

    tasks = [MyTaskSet]
