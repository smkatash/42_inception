NAME = inception

$(NAME):
		sudo docker-compose -f docker-compose.yml up -d --build

all:  $(NAME)

# 	Manipulations
build:
			sudo docker-compose build

up:
			sudo docker-compose -f docker-compose.yml up -d --build

down:
			sudo docker-compose -f docker-compose.yml down --rmi all

fclean:		sudo docker-compose down
			sudo docker rmi -f $$(docker images -aq)

logs:
			sudo docker-compose -f docker-compose.yml logs
