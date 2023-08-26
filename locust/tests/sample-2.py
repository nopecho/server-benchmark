from locust import HttpUser, TaskSet, task, between

class UserTasks2(TaskSet):

    @task
    def get_all(self):
        self.client.get("/api/v1/getAll")

class TestUser2(HttpUser):
    # host = custom
    # wait_time = between(0.1, 2)
    tasks = [UserTasks2]