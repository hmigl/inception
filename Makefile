.PHONY: magic now-you-see-me-now-you-dont

magic:
	docker-compose --file ./srcs/docker-compose.yaml up --build

now-you-see-me-now-you-dont:
	docker-compose --file ./srcs/docker-compose.yaml down
