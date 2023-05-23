FROM debian:buster

LABEL maintainer="hmigl <hmigl@blazingly-fast.com>" \
    version="1.0"

WORKDIR /var/www/html

RUN apt update && \
    apt install -y curl php php-fpm php-mysql

RUN mkdir -p /run/php && \
    echo  "\nlisten = 0.0.0.0:9000" >> /etc/php/7.3/fpm/pool.d/www.conf && \
    curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    if php ./wp-cli.phar --info >/dev/null 2>/dev/null; then \
      chmod +x ./wp-cli.phar && \
      mv wp-cli.phar /usr/local/bin/wp; \
    fi

COPY ./tools/wp_setup /usr/local/bin/

RUN chmod +x /usr/local/bin/wp_setup

EXPOSE 9000

ENTRYPOINT [ "wp_setup" ]

CMD ["php-fpm7.3", "-F"]
