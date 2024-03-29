THIS_FILE := $(lastword $(MAKEFILE_LIST))
.PHONY: help build up start down destroy stop restart
help:
	make -pRrq  -f $(THIS_FILE) : 2>/dev/null | awk -v RS= -F: '/^# File/,/^# Finished Make data base/ {if ($$1 !~ "^[#.]") {print $$1}}' | sort | egrep -v -e '^[^[:alnum:]]' -e '^$@$$'
env:
	mv .env.example .env
up: 
	docker-compose -f docker-compose.yml up -d
down: 
	docker-compose -f docker-compose.yml down
logs:
	docker-compose --file 'docker-compose.yml' --project-name 'mongodb-docker-compose' logs --follow --tail '1000'