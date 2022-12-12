FROM		debian:buster

COPY		./tools/script.sh		/tmp
COPY		./conf/wp_config.php	/tmp

RUN			apt-get update && apt-get install -y \
			php-fpm \
			php-mysql \
			curl \
			dumb-init \
			tar

# set config of php https://gist.github.com/excid3/3669e021f005e0f62900aeb980bc890d
RUN			echo "listen = 9000" >> /etc/php/7.3/fpm/pool.d/www.conf
RUN			curl -LO https://wordpress.org/latest.tar.gz
RUN			tar -xzvf latest.tar.gz

# dumb-init is a simple process supervisor and init system designed to run as PID 1 inside
ENTRYPOINT	["/usr/bin/dumb-init"]

EXPOSE		9000

CMD			["bash", "/tmp/script.sh"]

