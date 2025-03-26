NAME		= ft_server
IMAGE_NAME	= $(NAME)_image
CONTAINER_NAME	= $(NAME)_container
PORT_HTTP	= 80
PORT_HTTPS	= 443

.PHONY: all build run stop clean fclean re

all: build run

build:
	@echo "Building Docker image ⛏⛏⛏"
	@docker build -t $(IMAGE_NAME) .

run:
	@echo "Running Docker container 🚢🚢🚢"
	@docker run -d --rm --name $(CONTAINER_NAME) \
		-p $(PORT_HTTP):80 \
		-p $(PORT_HTTPS):443 \
		$(IMAGE_NAME)
	@echo "Container is running. You can access it on http://localhost"

stop:
	@echo "Stopping Docker container 🚢🚢🚢"
	@docker stop $(CONTAINER_NAME) || true

clean: stop
	@echo "Removing Docker container 🕸🕸🕸"

fclean: clean
	@echo "Removing Docker image 🕸🕸🕸"
	@docker rmi -f $(IMAGE_NAME) || true

re: fclean all
