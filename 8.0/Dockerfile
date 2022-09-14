FROM php:8.0-fpm-alpine

MAINTAINER Cedric Michaux <cedric@fullfrontend.be>

ENV PHP_PORT 9000
ENV CONFD_VERSION 0.16.0
ENV COMPOSER_ALLOW_SUPERUSER 1

EXPOSE $PHP_PORT

COPY entrypoint.sh /etc/php/entrypoint.sh
COPY confd/ /etc/confd

WORKDIR /tmp


RUN \
    curl -L -o /usr/local/bin/confd https://github.com/kelseyhightower/confd/releases/download/v${CONFD_VERSION}/confd-${CONFD_VERSION}-linux-amd64 \
    && chmod +x /usr/local/bin/confd

RUN apk add --no-cache --virtual .runtime-deps \
                gnupg \
                icu \
                imagemagick \
                libgomp \
                libpng \
                libpq \
                libtool \
                libxslt \
                libzip \
                oniguruma \
                unzip \
                wget \
                zip

RUN set -xe \
        && apk add --no-cache --virtual .build-deps \
            $PHPIZE_DEPS \
            freetype-dev \
            git \
            icu-dev \
            imagemagick-dev \
            libjpeg-turbo-dev \
            libmcrypt-dev \
            libpng-dev \
            libpq-dev \
            libwebp-dev \
            libxpm-dev \
            libxslt-dev \
            libzip-dev \
            oniguruma-dev \
            pcre-dev \
            zlib-dev \
        && export CFLAGS="$PHP_CFLAGS" CPPFLAGS="$PHP_CPPFLAGS" LDFLAGS="$PHP_LDFLAGS" \
        && git clone https://github.com/Imagick/imagick \
        && cd imagick \
        && phpize && ./configure \
        && make \
        && make install \
        && cd ../ \
        && rm -rf imagick \
        && docker-php-ext-enable imagick \
        && docker-php-ext-configure zip \
        && docker-php-ext-configure gd --with-freetype=/usr/include/ --with-jpeg=/usr/include/ \
        && docker-php-ext-install \
            bcmath \
            exif \
            gd \
            intl \
            mbstring \
            opcache \
            pdo_mysql \
            pdo_pgsql \
            xsl \
            zip \
        && apk del .build-deps \
        && rm -rf /tmp/*

COPY --from=composer:2.4  /usr/bin/composer /usr/bin/composer

ENTRYPOINT ["/etc/php/entrypoint.sh"]

CMD ["php-fpm"]
