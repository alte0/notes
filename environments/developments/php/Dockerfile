#FROM php:8.3.3-fpm
FROM php:8.3.3-cli

RUN apt-get -y update && apt-get -y upgrade

RUN apt-get -y install -y unzip libpq-dev curl git

RUN docker-php-ext-install -j$(nproc) pdo pdo_mysql pdo_pgsql
RUN pecl channel-update pecl.php.net && \
    pecl install xdebug && \
    docker-php-ext-enable xdebug

# Composer
COPY --from=composer:2.7.1 /usr/bin/composer /usr/bin/composer

RUN mv $PHP_INI_DIR/php.ini-development $PHP_INI_DIR/php.ini

WORKDIR /app

CMD php -S 0.0.0.0:8080 index.php