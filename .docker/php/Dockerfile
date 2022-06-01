FROM php:8.1-fpm

WORKDIR /app

RUN apt-get update && \
    apt-get install -y --no-install-recommends zip unzip libicu-dev && \
    rm -rf /var/lib/apt/lists/* && \
    docker-php-ext-configure intl && \
    docker-php-ext-install -j"$(nproc)" pdo_mysql intl pcntl


RUN pecl install xdebug && \
    docker-php-ext-enable xdebug

COPY custom.ini $PHP_INI_DIR/conf.d/

ENV COMPOSER_ALLOW_SUPERUSER=1
ENV COMPOSER_NO_INTERACTION=1
# Safe to ignore because we're copying from an external image
# hadolint ignore=DL3022
COPY --from=composer:2 /usr/bin/composer /usr/bin/composer

