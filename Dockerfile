FROM garypendergast/wordpress-develop-php:7.2-fpm

##########################################################################
#
# WARNING: This file was generated by update.php. Do not edit it directly.
#
#

# install wp-cli dependences
RUN set -ex; \
	\
	apt-get update; \
	\
	apt-get install -y --no-install-recommends \
		less \
		virtual-mysql-client \
	;

RUN set -ex; \
	\
	curl -oL /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar; \
	\
	chmod +x /usr/local/bin/wp; \
	\
	wp --allow-root --version;

WORKDIR /var/www

ENTRYPOINT [ "/usr/local/bin/wp", "--allow-root" ]

CMD [ "shell" ]
