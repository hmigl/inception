VOL_DIR := $(addprefix /home/hmiguel-/data/, wordpress mariadb)
DOCKER_COMPOSE_FILE := ./srcs/docker-compose.yaml

.PHONY: magic now-you-see-me-now-you-dont disappear

magic: | $(VOL_DIR)
	docker-compose --file $(DOCKER_COMPOSE_FILE) up --build

now-you-see-me-now-you-dont:
	docker-compose --file $(DOCKER_COMPOSE_FILE) down

disappear: now-you-see-me-now-you-dont
	docker-compose --file $(DOCKER_COMPOSE_FILE) rm -fsv
	docker stop $(docker ps -qa) 2> /dev/null || true
	docker rm $(docker ps -qa) 2> /dev/null || true
	docker rmi -f $(docker images -qa) 2> /dev/null || true
	docker volume rm $(docker volume ls -q) 2> /dev/null || true
	docker network rm $(docker network ls -q) 2> /dev/null || true
	docker system prune -fa --volumes
	rm -rf $(VOL_DIR)

$(VOL_DIR):
	mkdir -p $@
