FROM		debian:buster

RUN			apt-get update && apt-get install -y \
			dumb-init \
			nginx \
			openssl

RUN			openssl req -x509 -sha256 -nodes -days 365 -newkey rsa:2048 -subj \
			"/C=DE/ST=Germany/O=42Heilbronn/CN=ktashbae.42.fr" \
			-keyout /etc/ssl/private/ktashbae.key -out /etc/ssl/certs/ktashbae.crt

COPY		./conf.d/nginx.conf /etc/nginx/nginx.conf
COPY		./conf.d/hosts /etc/

ENTRYPOINT  ["/usr/bin/dumb-init"]

EXPOSE		443

# Keeps the logs free of messages about not being able to bind().
CMD			["nginx", "-g", "daemon off;"]