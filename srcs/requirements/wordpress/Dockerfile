# container base system
FROM debian:buster

# shell command to install tools
RUN apt-get update && apt-get -y install \
	php-fpm \
	php-cgi \
	php-common \
	php-opcache \
	php-mysqli \
	php-cli \
	php-gd \
	php-json \
	php-dom \
	php-mbstring \
	php-xml \
	php-zip \
	wget \
	openssl \
	vim

# Download wordpress and extract
RUN wget https://wordpress.org/latest.tar.gz \
	&& tar -xzvf latest.tar.gz && rm -rf latest.tar.gz

EXPOSE 9000

# Run FPM in foreground
CMD ["php-fpm7.3", "-F"]