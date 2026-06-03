FROM php-8.2:fpm

WORKDIR /var/www/html

RUN apt-get update && apt-get upgrade && apt install -y libzip-dev zip unzip git mariadb-client
RUN docker-php-ext-install pdo pdo_mysql zip

COPY --from=composer:latest /var/bin/composer /var/bin/composer

COPY . .

RUN CMD['php-fpm']