VOL_DIR := $(addprefix /home/hmiguel-/data/, wordpress mariadb)
DOCKER_COMPOSE_FILE := ./srcs/docker-compose.yaml

.PHONY: magic now-you-see-me-now-you-dont disappear

magic: | $(VOL_DIR)
	grep -Fxq "127.0.0.1 hmiguel-.42.fr" /etc/hosts || echo "127.0.0.1 hmiguel-.42.fr" | tee -a /etc/hosts
	docker-compose --file $(DOCKER_COMPOSE_FILE) up --build

now-you-see-me-now-you-dont:
	docker-compose --file $(DOCKER_COMPOSE_FILE) down

disappear: now-you-see-me-now-you-dont
	docker-compose --file $(DOCKER_COMPOSE_FILE) rm -fsv
	docker system prune -fa --volumes
	docker stop $(shell docker ps -qa) 2>/dev/null || true
	docker rm $(shell docker ps -qa) 2>/dev/null || true
	docker rmi -f $(shell docker images -qa) 2>/dev/null || true
	docker volume rm $(shell docker volume ls -q) 2>/dev/null || true
	docker network rm $(shell docker network ls -q) 2>/dev/null || true
	rm -rf $(VOL_DIR)

reappear: disappear magic

$(VOL_DIR):
	mkdir -p $@
