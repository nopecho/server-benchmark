DC_PATH := $(CURDIR)/docker-compose

SIMPLE_DC_FILE := $(DC_PATH)/docker-compose-simple.yml
DC_FILE := $(DC_PATH)/docker-compose.yml

HOST ?= http://host.docker.internal
PORT ?= 8080
URL ?= /

clean:
	rm -f $(DC_PATH)/.env

setup: clean
	echo "SIMPLE_HOST=$(HOST):$(PORT)" >> $(DC_PATH)/.env
	echo "SIMPLE_URL=$(URL)" >> $(DC_PATH)/.env

get: setup
	@docker-compose -f $(SIMPLE_DC_FILE) up

up:
	@docker-compose -f $(DC_FILE) up

down:
	@docker-compose -f $(DC_FILE) down

logs:
	@docker-compose -f $(DC_FILE) logs -f

default: up