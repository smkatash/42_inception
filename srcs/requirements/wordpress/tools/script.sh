#!bin/bash/

#move wordpress compressed file to root directory & decompress it
wp core download --path=/var/www/wordpress --allow-root

cp /tmp/wp_config.php /var/www/wordpress/
cp /tmp/www.conf /etc/php/7.3/fpm/pool.d/www.conf
# read rights for the user and group
chown -R www-data:www-data /var/www/wordpress/

usermod -aG www-data www-data
#set up daemonize to 'no' in the php-fpm.conf 
sed -i -e "s|;daemonize = yes|daemonize = no|g" /etc/php/7.3/fpm/php-fpm.conf

wp core install --url=$DOMAIN_NAME --title=$WP_TITLE --admin_user=$WP_DB_HOST --admin_password=$WP_HOST_PASSWORD --admin_email=$WP_HOST_EMAIL --skip-email --path=/var/www/wordpress --allow-root
wp plugin update --all --path=/var/www/wordpress --allow-root
wp user create $WP_USER $WP_USER_EMAIL --role=author --user_pass=$WP_USER_PASSWORD --path=/var/www/wordpress --allow-root

exec /usr/sbin/php-fpm7.3
