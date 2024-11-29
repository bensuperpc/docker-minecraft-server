#//////////////////////////////////////////////////////////////
#//                                                          //
#//  Script, 2022                                            //
#//  Created: 14, April, 2022                                //
#//  Modified: 30, November, 2024                            //
#//  file: -                                                 //
#//  -                                                       //
#//  Source:                                                 //
#//  OS: ALL                                                 //
#//  CPU: ALL                                                //
#//                                                          //
#//////////////////////////////////////////////////////////////

SERVER_DIRECTORY := minecraft-server

DOCKER := docker

# Disable: mc-web mc-backup
PROFILES := mc-proxy mc-server
PROFILE_CMD := $(addprefix --profile ,$(PROFILES))

COMPOSE_FILES :=  $(shell find ./$(SERVER_DIRECTORY) -name 'docker-compose*.yml' -type f | sed -e 's/^/--file /')
COMPOSE_DIR := --project-directory ./$(SERVER_DIRECTORY)

UID := 1000
GID := 1000

#PUID=$(UID) PGID=$(GID)
ENV_ARG_VAR := 

DOCKER_COMPOSE_COMMAND := $(ENV_ARG_VAR) $(DOCKER) compose $(COMPOSE_DIR) $(COMPOSE_FILES) $(PROFILE_CMD)

.PHONY: build all
all: start

.PHONY: build
build:
	$(DOCKER_COMPOSE_COMMAND) build

.PHONY: start
start:
	$(DOCKER_COMPOSE_COMMAND) up -d

.PHONY: start-at
start-at:
	$(DOCKER_COMPOSE_COMMAND) up

.PHONY: docker-check
docker-check:
	$(DOCKER_COMPOSE_COMMAND) config

.PHONY: stop
stop: down

.PHONY: down
down:
	$(DOCKER_COMPOSE_COMMAND) down

.PHONY: restart
restart: stop start

.PHONY: logs
logs:
	$(DOCKER_COMPOSE_COMMAND) logs

.PHONY: state
state:
	$(DOCKER_COMPOSE_COMMAND) ps
	$(DOCKER_COMPOSE_COMMAND) top

.PHONY: update-docker
update-docker:
	$(DOCKER_COMPOSE_COMMAND) pull

.PHONY: update
update: update-docker
	git submodule update --init --recursive --remote
	git pull --recurse-submodules --all --progress

.PHONY: clean
clean:
	docker system prune -f

.PHONY: purge
purge:
	$(ENV_ARG_VAR) $(DOCKER) compose $(COMPOSE_DIR) $(COMPOSE_FILES) down -v --rmi all
