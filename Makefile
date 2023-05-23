VOL_DIR := $(addprefix $(HOME)/data/, wordpress)
DOCKER_COMPOSE_FILE := ./srcs/docker-compose.yaml

.PHONY: magic now-you-see-me-now-you-dont

magic: | $(VOL_DIR)
	docker-compose --file $(DOCKER_COMPOSE_FILE) up --build

now-you-see-me-now-you-dont:
	docker-compose --file $(DOCKER_COMPOSE_FILE) down

$(VOL_DIR):
	mkdir -p $@
