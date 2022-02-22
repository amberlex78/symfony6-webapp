FROM php:8.1-cli

# First
RUN export DEBIAN_FRONTEND="noninteractive" && \
    apt-get update && apt-get install -y dialog apt-utils libpq-dev unzip wget git && \
    echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections

# Versions: https://xdebug.org/download/historical
ENV XDEBUG_VERSION 3.1.3
RUN pecl install xdebug-$XDEBUG_VERSION && docker-php-ext-enable xdebug

# Composer
ENV COMPOSER_ALLOW_SUPERUSER 1
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer -q

# Symfony CLI
RUN echo 'deb [trusted=yes] https://repo.symfony.com/apt/ /' | tee /etc/apt/sources.list.d/symfony-cli.list && \
    apt-get update && apt-get install -y symfony-cli

# Config Git
RUN git config --global user.email "you@example.com" && \
    git config --global user.name "Your Name"


# PHP Database
RUN docker-php-ext-configure pdo_mysql --with-pdo-mysql=mysqlnd && docker-php-ext-install pdo_mysql
#vRUN docker-php-ext-configure pgsql --with-pgsql=/usr/local/pgsql && docker-php-ext-install pdo_pgsql

# PHP Extensions
# docker-php-ext-install sockets

# Config PHP
RUN cp $PHP_INI_DIR/php.ini-development $PHP_INI_DIR/php.ini
COPY ./conf.d $PHP_INI_DIR/conf.d

WORKDIR /app
