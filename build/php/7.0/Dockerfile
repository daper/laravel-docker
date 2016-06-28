FROM php:7.0-fpm-alpine
MAINTAINER "David Peralta <david@daper.email>"

RUN printf "\n%s\n%s" "@edge http://dl-cdn.alpinelinux.org/alpine/edge/main" "@testing http://dl-cdn.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories \
    && apk update && apk upgrade \
    && apk add autoconf automake make gcc g++ libtool pkgconfig libmcrypt-dev re2c openssl-dev git zlib-dev xdg-utils libpng-dev

RUN docker-php-ext-install -j$(grep -c ^processor /proc/cpuinfo 2>/dev/null || 1) gd curl mcrypt mysqli pdo_mysql bcmath zip xml xmlreader xmlwriter simplexml soap json iconv fileinfo dom gd

RUN apk add rabbitmq-c@testing rabbitmq-c-dev@testing \
    && pecl install amqp \
    && docker-php-ext-enable amqp

RUN pecl install raphf \
    && docker-php-ext-enable raphf

RUN apk add libmemcached-dev \
    && git clone "https://github.com/php-memcached-dev/php-memcached.git" \
    && cd php-memcached \
    && git checkout php7 \
    && phpize \
    && ./configure --disable-memcached-sasl \
    && make \
    && make install \
    && docker-php-ext-enable memcached

RUN pecl install mongodb \
    && docker-php-ext-enable mongodb

RUN pecl install apcu \
    && docker-php-ext-enable apcu

RUN pecl install xdebug \
    && docker-php-ext-enable xdebug

RUN curl -sS "https://getcomposer.org/installer" | php
RUN mv composer.phar /usr/local/bin/composer

COPY php.ini /usr/local/etc/php/conf.d/custom.ini
COPY fpm.conf /usr/local/etc/php-fpm.d/zzz-fpm.conf
WORKDIR /var/www

RUN rm -rf /var/cache/apk && mkdir -p /var/cache/apk