FROM debian:buster

RUN apt update && apt upgrade -y && apt install -y mariadb-server

RUN sed -i 's/^bind-address/#&/' /etc/mysql/mariadb.conf.d/50-server.cnf

LABEL maintainer="hmigl <hmigl@blazingly-fast.com>" \
    version="1.0"
