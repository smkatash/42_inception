FROM		debian:buster

COPY		./tools/init_db.sql		/tmp/
COPY		./tools/script.sh		/tmp/
COPY		./conf/conf 			/tmp/

RUN			apt-get update
RUN			apt-get install -y \
				mariadb-server \
				mariadb-client \
				dumb-init

RUN			chmod 111 /tmp/script.sh
RUN			mv ./tmp/conf /etc/mysql/conf
RUN			chmod 0444 /etc/mysql/conf

ENTRYPOINT	["/usr/bin/dumb-init"]

EXPOSE		3306

CMD			["/tmp/script.sh"]
