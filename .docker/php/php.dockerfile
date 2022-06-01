FROM php:8.1-fpm

WORKDIR /app

#include "php-apt-dependencies.dockerfile"

RUN pecl install xdebug && \
    docker-php-ext-enable xdebug

COPY custom.ini $PHP_INI_DIR/conf.d/

#include "install-composer.dockerfile"
