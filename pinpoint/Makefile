DC_PATH := $(CURDIR)
DC_FILE := $(DC_PATH)/docker-compose.yml

clean:
	rm -f $(DC_PATH)/.env && rm -rf $(CURDIR)/hbase && rm -rf $(CURDIR)/mysql

setup: clean
	./scripts/setup.sh

up: setup
	@docker-compose -f $(DC_FILE) up -d

down: clean
	@docker-compose -f $(DC_FILE) down

logs:
	@docker-compose -f $(DC_FILE) logs -f

open:
	./scripts/open.sh

agent-java:
	cat $(CURDIR)/Dockerfile

default: up