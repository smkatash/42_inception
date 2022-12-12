#!bin/bash/

#move wordpress compressed file to root directory & decompress it
mv wordpress/ /var/www/
rm latest.tar.gz

mv /tmp/wp-config.php /var/www/wordpress
chown -R www-data:www-data /var/www/wordpress/

#set up daemonize to 'no' in the php-fpm.conf 
sed -i -e "s|MYSQL_DATABASE|'$MYSQL_DATABASE'|g" /var/www/wordpress/wp-config.php
sed -i -e "s|MYSQL_USER|'$MYSQL_USER'|g" /var/www/wordpress/wp-config.php
sed -i -e "s|MYSQL_PASSWORD|'$MYSQL_PASSWORD'|g" /var/www/wordpress/wp-config.php
sed -i -e "s|;daemonize = yes|daemonize = no|g" /etc/php/7.3/fpm/php-fpm.conf
mkdir -p /run/php/

exec /usr/sbin/php-fpm7.3
