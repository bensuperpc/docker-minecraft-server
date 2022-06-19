#//////////////////////////////////////////////////////////////
#//   ____                                                   //
#//  | __ )  ___ _ __  ___ _   _ _ __   ___ _ __ _ __   ___  //
#//  |  _ \ / _ \ '_ \/ __| | | | '_ \ / _ \ '__| '_ \ / __| //
#//  | |_) |  __/ | | \__ \ |_| | |_) |  __/ |  | |_) | (__  //
#//  |____/ \___|_| |_|___/\__,_| .__/ \___|_|  | .__/ \___| //
#//                             |_|             |_|          //
#//////////////////////////////////////////////////////////////
#//                                                          //
#//  Script, 2022                                            //
#//  Created: 14, April, 2022                                //
#//  Modified: 19, June, 2022                                //
#//  file: -                                                 //
#//  -                                                       //
#//  Source:                                                 //
#//  OS: ALL                                                 //
#//  CPU: ALL                                                //
#//                                                          //
#//////////////////////////////////////////////////////////////

DOCKER := docker

PROFILE := mc-proxy mc-server mc-server-waitroom mc-backup mc-web
PROFILE_CMD := $(addprefix --profile ,$(PROFILE))

COMPOSE_FILE := docker-compose.yml

AUTHOR := itzg

IMAGE_NAME := minecraft-server mc-backup minecraft-bedrock-server bungeecord mc-router rcon

IMAGE_AUTHOR := $(addprefix itzg/, $(IMAGE_NAME))

IMAGE_FULL_NAME := $(addsuffix :latest, $(IMAGE_AUTHOR))

.PHONY: build all
all: start

.PHONY: start
start:
	docker-compose -f $(COMPOSE_FILE) $(PROFILE_CMD) up -d

.PHONY: stop
stop:
	docker-compose -f $(COMPOSE_FILE) $(PROFILE_CMD) stop

.PHONY: down
down:
	docker-compose -f $(COMPOSE_FILE) $(PROFILE_CMD) down

.PHONY: restart
restart:
	docker-compose -f $(COMPOSE_FILE) $(PROFILE_CMD) restart

.PHONY: logs
logs:
	docker-compose -f $(COMPOSE_FILE) logs

.PHONY: state
state:
	docker-compose -f $(COMPOSE_FILE) ps
	docker-compose -f $(COMPOSE_FILE) top

.PHONY: update
update:
	git pull --recurse-submodules --all --progress
	echo $(IMAGE_FULL_NAME) | xargs -n1 docker pull

.PHONY: clean
clean: $(SUBDIRS)
	$(DOCKER) images --filter=reference='bensuperpc/*' --format='{{.Repository}}:{{.Tag}}' | xargs -r $(DOCKER) rmi -f
