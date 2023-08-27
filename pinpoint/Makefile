DC_PATH := $(CURDIR)
DC_FILE := $(DC_PATH)/docker-compose.yml

clean:
	rm -f $(DC_PATH)/.env

setup: clean
	./scripts/setup.sh

up: setup
	@docker-compose -f $(DC_FILE) up -d

down:
	@docker-compose -f $(DC_FILE) down

logs:
	@docker-compose -f $(DC_FILE) logs -f

open:
	./scripts/open.sh

default: up