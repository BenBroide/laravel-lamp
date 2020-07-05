FROM php:7.3-apache

RUN a2enmod rewrite
COPY 000-default.conf /etc/apache2/sites-enabled/000-default.conf

RUN docker-php-ext-install mysqli pdo pdo_mysql
RUN apt-get update \
    && apt-get install -y libzip-dev \
    && apt-get install -y zlib1g-dev \
    && rm -rf /var/lib/apt/lists/* \
    && docker-php-ext-install zip

WORKDIR /var/www/html
RUN pwd
RUN ls


ENV COMPOSER_HOME /composer
ENV PATH ./vendor/bin:/composer/vendor/bin:$PATH
ENV COMPOSER_ALLOW_SUPERUSER 1
RUN curl -s https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin/ --filename=composer
RUN composer global require laravel/installer
RUN composer create-project laravel/laravel .

COPY .htaccess.www /var/www/html/.htaccess
COPY .htaccess.www.public var/www/html/public/.htaccess
RUN rm /var/www/html/.env
RUN ls -A
COPY .env.local /var/www/html/.env

RUN chown -R www-data:www-data /var/www/html
RUN php artisan serve --port=8001

