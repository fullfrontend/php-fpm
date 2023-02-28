# php-fpm for docker

Base php configuration for PHP 8.2 and 8.1.

## How to use this image

This image can be used as-is. It contains composer 2.5

It runs PHP 8.1-fpm-alpine or 8.2-fpm-alpine with those extensions:
* bcmath
* exif
* gd
* intl
* mbstring
* opcache
* pdo_mysql
* pdo_pgsql
* xsl
* zip
  
The base command to run it is:

    docker run --name php -d -p 9000:9000 he8us/php-fpm:latest

It can be configured using environment variables:

 * `APP_ENV` Default: `dev`
 * `TIMEZONE` Default: `Europe\Brussels`
 * `PHP_DISPLAY_ERRORS` Default: `On`
 * `PHP_DISPLAY_STARTUP_ERRORS` Default: `On`
 * `PHP_OPCACHE_VALIDATE_TIMESTAMPS` Default: `0`

* If `APP_ENV` === `prod`
    * `PHP_DISPLAY_ERRORS` Default: `Off` 
    * `PHP_DISPLAY_STARTUP_ERRORS` Default: `Off` 
    * `PHP_OPCACHE_VALIDATE_TIMESTAMPS` Default: `1` 

And there's my docker-compose sample:

    php:
        image: he8us/php-fpm:8.2
        expose:
            - 9000
        environment:
            APP_ENV: dev
            TIMEZONE: "Europe/Brussels"

        volumes_from:
            - application
