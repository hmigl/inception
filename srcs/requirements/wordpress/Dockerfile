FROM debian:buster

LABEL maintainer="hmigl <hmigl@blazingly-fast.com>" \
    version="1.0"

WORKDIR /var/www/html

RUN apt update && \
    apt install -y curl php

RUN curl -O https://raw.githubusercontent.com/wp-cli/builds/gh-pages/phar/wp-cli.phar && \
    if php ./wp-cli.phar --info >/dev/null 2>/dev/null; then \
      chmod +x ./wp-cli.phar && \
      mv wp-cli.phar /usr/local/bin/wp; \
    fi
