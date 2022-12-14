FROM		debian:buster

RUN			echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN			apt-get update && apt-get install -y \
			dumb-init \
			nginx \
			openssl

RUN			openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -subj \
			"/C=DE/ST=Germany/O=42Heilbronn/CN=ktashbae.42.fr" \
			-keyout /etc/ssl/private/ktashbae.key -out /etc/ssl/certs/ktashbae.crt

COPY		./conf.d/hosts /etc/
COPY		./conf.d/nginx.conf /etc/nginx/nginx.conf
RUN			rm /etc/nginx/sites-enabled/default

# a simple process supervisor and init system designed to run as PID 1 inside
ENTRYPOINT  ["/usr/bin/dumb-init"]
# inter-container communication
#EXPOSE		443

# Keeps the logs free of messages about not being able to bind().
CMD			["nginx", "-g", "daemon off;"]