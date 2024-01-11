# COLORS
GREEN	= \033[0;32m
RED		= \033[0;31m
MAGENTA	= \033[0;35m
RESET	= \033[0m

pull:
	docker-compose pull

up:
	mkdir -p ~/Documents/WORDPRESS_SITE/wordpress_data
	mkdir -p ~/Documents/WORDPRESS_SITE/mysql_data
	docker-compose up -d

down:
	docker compose down

clean:
	docker compose down --volumes

fclean: clean
	sudo rm -rf ~/Documents/WORDPRESS_SITE/wordpress_data
	sudo rm -rf ~/Documents/WORDPRESS_SITE/mysql_data
	docker system prune --all --force

ls:
	@echo "$(MAGENTA)-> Images:$(RESET)" && docker images
	@echo "$(MAGENTA)-> Running Containers:$(RESET)" && docker ps
	@echo "$(MAGENTA)-> volumes:$(RESET)" && docker volume ls
#	@echo "$(MAGENTA)-> networks:$(RESET)" && docker network ls
	@echo "$(MAGENTA)-> custom networks:$(RESET)" && docker network ls | awk '$$2 !~ /^(bridge|host|none)$$/'

.PHONY: build up down clean fclean rebuild ls
