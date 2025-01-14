FROM php:7.4.1-apache

USER root

WORKDIR /var/www/html/

COPY . /var/www/html/

# install dependancies

RUN apt-get update && apt-get install -y \
	libpng-dev \
    zlib1g-dev \
    libxml2-dev \
    libzip-dev \ 
    zip \
    curl \
    unzip \
    && docker-php-ext-configure gd \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install pdo_mysql \
    && docker-php-ext-install mysqli \
    && docker-php-ext-install zip \
    && docker-php-source delete
