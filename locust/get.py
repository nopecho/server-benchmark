import os

from locust import HttpUser, TaskSet, task, between

class SimpleTask(TaskSet):

    @task
    def simple_get(self):
        path = os.environ.get("TARGET_PATH")
        self.client.get(path)

class SimpleUser(HttpUser):
    # wait_time = between(0.1, 2)
    tasks = [SimpleTask]