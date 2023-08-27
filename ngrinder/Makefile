DC_PATH := $(CURDIR)
DC_FILE := $(DC_PATH)/docker-compose.yml

up:
	@docker-compose -f $(DC_FILE) up

down:
	@docker-compose -f $(DC_FILE) down

logs:
	@docker-compose -f $(DC_FILE) logs -f

default: up