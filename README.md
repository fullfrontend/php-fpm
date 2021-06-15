# docker-php-fpm

[![](https://images.microbadger.com/badges/version/he8us/php-fpm.svg)](http://microbadger.com/images/he8us/php-fpm "Get your own version badge on microbadger.com") [![](https://images.microbadger.com/badges/image/he8us/php-fpm.svg)](http://microbadger.com/images/he8us/php-fpm "Get your own image badge on microbadger.com")

Base php configuration.

## How to use this image

This image can be used as-is. It contains composer 2.1

It runs PHP 8.0-fpm-alpine with:
* bcmath 
* exif
* gd 
* intl
* mbstring
* OPcache
* pdo_mysql
* zip
  
The base command to run it is:

    docker run --name php -d -p 9000:9000 he8us/docker-php-fpm

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
        image: he8us/docker-php-fpm:8.0
        expose:
            - 9000
        environment:
            APP_ENV: dev
            TIMEZONE: "Europe/Brussels"

        volumes_from:
            - application
