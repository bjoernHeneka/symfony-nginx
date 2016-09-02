FROM debian:jessie

MAINTAINER Björn Heneka <bheneka@codebee.de>

ENV PHP_FPM_SERVICE=php
ENV PHP_FPM_PORT=9000

EXPOSE 80
EXPOSE 443

RUN apt-get update && \
    apt-get install -y \
    nginx \
    gettext \
    vim \
    php5-ldap && \
    apt-get clean && \
    rm -fr /var/lib/apt/lists/*

ADD nginx.conf /etc/nginx/
ADD symfony.conf /etc/nginx/sites-available/
ADD upstream.conf.template /files/upstream.conf.template
ADD start.sh /files/start.sh

RUN ln -s /etc/nginx/sites-available/symfony.conf /etc/nginx/sites-enabled/symfony \
    && rm /etc/nginx/sites-enabled/default \
    && usermod -u 1000 www-data \
    && chmod +x /files/start.sh

WORKDIR /var/www/symfony

ENTRYPOINT ["/bin/bash", "/files/start.sh"]
