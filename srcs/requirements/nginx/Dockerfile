# Base system of the container
FROM debian:buster

# shell command to install openssl && nginx
RUN apt-get update && apt-get install -y \
	openssl \
	nginx

# Create SSl certificate and key
# Generate a 2048-bit RSA key, create certificate sign request and self-sign the certificate
RUN mkdir /etc/nginx/ssl \
	&& openssl req -newkey rsa:2048 -new -nodes -x509 -days 365 -keyout /etc/nginx/ssl/ktashbae.key \
	-out /etc/nginx/ssl/ktashbae.csr -subj '/C=DE/P=Heilbronn/O=42/CN=ktashbae'


# The sites-available folder is for storing all vhost configurations, whether or not they're currently enabled.
# The sites-enabled folder contains symlinks to files in the sites-available folder. This allows you to selectively disable vhosts by removing the symlink.
# conf.d does the job && adapts the default configuration
COPY ./conf.d/nginx.conf /etc/nginx/conf.d
RUN ln -sf /dev/stdout /var/log/nginx/access.log && \
	ln -sf /dev/stderr /var/log/nginx/error.log

EXPOSE 443

# CMD int order for nginx to stay in the foreground, so that Docker can track the process properly 
# (otherwise your container will stop immediately after starting)
CMD ["nginx", "-g", "daemon off;"]
