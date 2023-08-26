import os

from locust import HttpUser, TaskSet, task, between

class SimpleTask(TaskSet):

    @task
    def simple_get(self):
        path = os.environ.get("SIMPLE_URL")
        self.client.get(path)

class SimpleUser(HttpUser):
    host = os.environ.get("SIMPLE_HOST")
    # wait_time = between(0.1, 2)
    tasks = [SimpleTask]