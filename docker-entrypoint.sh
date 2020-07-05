php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php composer-setup.php --filename=composer --install-dir=/usr/bin
composer global require laravel/installer
composer create-project laravel/laravel .
