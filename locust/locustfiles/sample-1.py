from locust import HttpUser, TaskSet, task, between

class UserTasks(TaskSet):

    @task
    def get_all(self):
        self.client.get("/api/v1/get")

class TestUser(HttpUser):
    # host = custom
    # wait_time = between(0.1, 2)
    tasks = [UserTasks]