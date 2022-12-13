#!/bin/bash

chown -R mysql:mysql /var/lib/mysql
sed -i "s|.*bind-address\s*=.*|bind-address=0.0.0.0|" /etc/mysql/mariadb.conf.d/50-server.cnf
sed -i "s|#port|port |" /etc/mysql/mariadb.conf.d/50-server.cnf

service mysql start

mysql --user=$DB_ROOT << EOF
CREATE DATABASE IF NOT EXISTS $DB_NAME;
CREATE USER IF NOT EXISTS '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PWD';
GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'%' IDENTIFIED BY '$DB_USER_PWD' WITH GRANT OPTION;
GRANT ALL PRIVILEGES ON *.* TO '$DB_ROOT'@'%' IDENTIFIED BY '$DB_ROOT_PWD';
FLUSH PRIVILEGES;

UPDATE mysql.user SET Password=PASSWORD('$DB_ROOT_PWD') WHERE User='$DB_ROOT';
UPDATE mysql.user SET plugin = '' WHERE User = '$DB_ROOT' AND host = 'localhost';
EOF

sleep 15
service mysql stop

exec mysqld_safe