FROM debian:buster

RUN			echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

RUN			apt-get update && apt-get install -y \
			dumb-init \
			nginx

RUN			mkdir -p /etc/tmp

COPY		./config/* /etc/tmp/
COPY		./conf.d/nginx.conf /etc/nginx/nginx.conf
RUN			rm /etc/nginx/sites-enabled/default