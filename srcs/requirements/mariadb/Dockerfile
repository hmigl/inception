FROM debian:buster

LABEL maintainer="hmigl <hmigl@blazingly-fast.com>" \
    version="1.0"

RUN apt update && apt upgrade -y && apt install -y mariadb-server

RUN sed -i 's/^bind-address/#&/' /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/setup ./

ENTRYPOINT [ "bash", "setup" ]
