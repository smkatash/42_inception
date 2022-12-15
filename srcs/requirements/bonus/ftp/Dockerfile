FROM	debian:buster

RUN		apt-get update && apt-get install -y \
		vsftpd

COPY	./config/vsftpd.conf /tmp/
COPY	./tools/script.sh /tmp/

ENTRYPOINT	["/tmp/script.sh"]
