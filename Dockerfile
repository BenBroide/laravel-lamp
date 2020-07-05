FROM php:7.3-apache
RUN a2enmod rewrite
COPY 000-default.conf /etc/apache2/sites-enabled/000-default.conf

RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN apt-get update \
    && apt-get install -y libzip-dev \
    && apt-get install -y zlib1g-dev \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install zip

ENV COMPOSER_HOME /composer
ENV PATH ./vendor/bin:/composer/vendor/bin:$PATH
ENV COMPOSER_ALLOW_SUPERUSER 1
RUN curl -s https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/ --filename=composer
RUN composer global require laravel/installer
RUN cd /var/www/html && laravel new
