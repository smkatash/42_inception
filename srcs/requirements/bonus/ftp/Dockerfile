FROM	debian:buster

RUN		apt-get update && apt-get install -y \
		vsftpd

COPY	./config/vsftpd.conf /etc/vsftpd/
COPY	./tools/script.sh /tmp/


RUN		mkdir -p /var/run/vsftpd/empty
RUN		mkdir -p /var/www/wordpress/ftp_user
RUN		chmod 755 /tmp/

ENTRYPOINT	["/tmp/script.sh"]
