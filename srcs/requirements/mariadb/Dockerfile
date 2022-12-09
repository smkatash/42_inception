# container base system
FROM debian:buster

# install mariadb
RUN apt-get update && apt-get -y install mariadb-server mariadb-client

# make /var/run/mysqld dir and assign read rights
RUN mkdir -p /var/run/mysqld && chown -R mysql:mysql /var/run/mysqld

# db port
EXPOSE 3306

# copy tools
COPY ./tools/db_init.sql /tmp/
COPY ./tools/script.sh /tmp/

# db init
RUN chmod 755 /tmp/script.sh
RUN bash /tmp/script.sh

# shell cmd
CMD mysqld
