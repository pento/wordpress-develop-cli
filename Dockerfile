FROM garypendergast/wordpress-develop-php

# install wp-cli dependences
RUN set -ex; \
	\
	apt-get update; \
	\
	apt-get install -y --no-install-recommends \
		less \
		mysql-client \
	;

RUN set-ex; \
	\
	curl -o /usr/local/bin/wp https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar; \
	\
	chmod +x /usr/local/bin/wp; \
	\
	wp --allow-root --version;

WORKDIR /var/www

CMD ["wp", "shell"]
