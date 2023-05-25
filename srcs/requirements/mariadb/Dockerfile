FROM debian:buster

LABEL maintainer="hmigl <hmigl@blazingly-fast.com>" \
    version="1.0"

RUN apt update && \
    apt install -y mariadb-server

RUN [ -f /etc/mysql/mariadb.conf.d/50-server.cnf ] && \
    sed -i 's/bind-address .*/bind-address = 0.0.0.0/' /etc/mysql/mariadb.conf.d/50-server.cnf

COPY ./tools/mariadb_setup /usr/local/bin/

RUN chmod +x /usr/local/bin/mariadb_setup && \
    mkdir -p /var/run/mysqld && \
    chmod -R 777 /var/run/mysqld

EXPOSE 3306

ENTRYPOINT [ "mariadb_setup" ]
