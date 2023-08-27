DC_PATH := $(CURDIR)/docker-compose
DC_FILE_GET := $(DC_PATH)/docker-compose-get.yml
DC_FILE := $(DC_PATH)/docker-compose.yml
HOST ?= http://host.docker.internal
PORT ?= 8080
host.docker.internal ?= /

clean:
	rm -f $(DC_PATH)/.env

setup: clean
	echo "LOCUST_HOST=$(HOST):$(PORT)" >> $(DC_PATH)/.env
	echo "TARGET_PATH=$(TARGET)" >> $(DC_PATH)/.env

get: setup
	@docker-compose -f $(DC_FILE_GET) up

up: setup
	@docker-compose -f $(DC_FILE) up

down:
	@docker-compose -f $(DC_FILE) down

logs:
	@docker-compose -f $(DC_FILE) logs -f

open:
	./scripts/open.sh

default: up open