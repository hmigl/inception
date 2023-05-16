.PHONY: magic now-you-see-me-now-you-dont

magic:
	docker-compose --file ./srcs/docker-compose.yml up --build

now-you-see-me-now-you-dont:
	docker-compose --file ./srcs/docker-compose.yml down
