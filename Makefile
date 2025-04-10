NAME		= ft_server
COMPOSE_FILE	= srcs/docker-compose.yaml
PROJECT_NAME	= srcs

.PHONY: all up down build logs clean fclean re

all: build up

up:
	@echo "Starting services with docker-compose 🚢🚢🚢"
	@docker-compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) up -d
	@echo "Services are running. You can access them on http://localhost"

down:
	@echo "Stopping services with docker-compose 🚢🚢🚢"
	@docker-compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) down

build:
	@echo "Building services with docker-compose ⛏⛏⛏"
	@docker-compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) build

logs:
	@echo "Displaying logs for services 📜📜📜"
	@docker-compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) logs

clean: down
	@echo "Cleaning up volumes and networks 🕸🕸🕸"
	@docker-compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) down --volumes --remove-orphans

fclean: clean
	@echo "Removing all images related to the project 🕸🕸🕸"
	@docker-compose -f $(COMPOSE_FILE) -p $(PROJECT_NAME) rm -f

re: fclean all