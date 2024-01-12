# This Makefile is used to build and run the docker-compose.yml file
# located in the same directory as this Makefile.
# For more information on how to use this Makefile, please refer to
# the README.md file located in the same directory as this Makefile.
# Made by: github.com/svvoii

# COLORS
MAGENTA	= \033[0;35m
RESET	= \033[0m

pull:
	docker-compose pull

up:
	mkdir -p ./wordpress_data
	mkdir -p ./mysql_data
	docker-compose up -d

down:
	docker compose down

restart: down up

clean_data:
	docker compose down --volumes
	docker system prune --all --force
	sudo rm -rf ./wordpress_data
	sudo rm -rf ./mysql_data

ls:
	@echo "$(MAGENTA)-> Images:$(RESET)" && docker images
	@echo "$(MAGENTA)-> Running Containers:$(RESET)" && docker ps
	@echo "$(MAGENTA)-> volumes:$(RESET)" && docker volume ls
#	@echo "$(MAGENTA)-> networks:$(RESET)" && docker network ls
	@echo "$(MAGENTA)-> custom networks:$(RESET)" && docker network ls | awk '$$2 !~ /^(bridge|host|none)$$/'

.PHONY: build up down clean fclean rebuild ls
