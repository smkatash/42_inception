NAME = inception

$(NAME):
			sudo mkdir -p /home/ktashbae/data/db
			sudo mkdir -p /home/ktashbae/data/wordpress
			sudo docker-compose -f ./srcs/docker-compose.yml up -d --build

all:  $(NAME)

# 	Manipulations
build:
			sudo docker-compose build

up:
			sudo docker-compose -f ./srcs/docker-compose.yml up -d --build

down:
			sudo docker-compose -f ./srcs/docker-compose.yml down --rmi all

fclean:		sudo docker-compose down
			sudo docker rmi -f $$(docker images -aq)

# Inspections
list:
			sudo docker-compose -f ./srcs/docker-compose.yml ls

logs:
			sudo docker-compose -f ./srcs/docker-compose.yml logs
