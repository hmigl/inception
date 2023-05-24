FROM debian:buster

LABEL maintainer="hmigl <hmigl@blazingly-fast.com>" \
    version="1.0"

RUN apt update && \
    apt install -y nginx openssl

COPY ./conf/nginx.conf /etc/nginx/conf.d/default.conf

RUN mkdir -p /etc/nginx/ssl/ && \
    openssl req -x509 -nodes -days 365 -newkey rsa:4096 \
    -keyout /etc/nginx/ssl/inception.key \
    -out /etc/nginx/ssl/inception.crt \
    -subj "/C=BR/ST=SP/L=Sao Paulo/O=Ecole 42/CN=hmiguel-.42.fr"

EXPOSE 80

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]
