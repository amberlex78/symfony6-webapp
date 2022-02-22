FROM php:8.1-fpm

# First
RUN export DEBIAN_FRONTEND="noninteractive" && \
    apt-get update && apt-get install -y dialog apt-utils libpq-dev && \
    echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections


# PHP Database
RUN docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd && docker-php-ext-install pdo_mysql
# RUN docker-php-ext-configure pgsql --with-pgsql=/usr/local/pgsql && docker-php-ext-install pdo_pgsql

# PHP Extensions
# docker-php-ext-install sockets

# Config PHP
RUN cp $PHP_INI_DIR/php.ini-development $PHP_INI_DIR/php.ini
COPY ./conf.d $PHP_INI_DIR/conf.d

WORKDIR /app
