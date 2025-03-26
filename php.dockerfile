FROM php:8-fpm-alpine

ENV PHPGROUP=aluna
ENV PHPUSER=aluna

RUN adduser -g ${PHPGROUP} -s /bin/sh -D ${PHPUSER}

RUN sed -i "s/user = www-data/user = ${PHPUSER}/g" /usr/local/etc/php-fpm.d/www.conf
RUN sed -i "s/group = www-data/group = ${PHPGROUP}/g" /usr/local/etc/php-fpm.d/www.conf

RUN mkdir -p /var/www/html/public

RUN apk update &&  \
    apk add php84-dev && \
    apk add autoconf && \
    apk add automake && \
    apk add gcc && \
    apk add make && \
    apk add g++ && \
    apk add zlib-dev && \
    apk add libtool && \
    apk add liblzf-dev && \
    apk add zstd-dev && \
    apk add lz4-dev && \
    apk add openssl

RUN docker-php-ext-install pdo pdo_mysql

RUN pecl install igbinary \
    && rm -rf /tmp/pear \
    && docker-php-ext-enable igbinary

RUN pecl install msgpack \
    && docker-php-ext-enable msgpack

RUN pecl install lzf \
    && rm -rf /tmp/pear \
    && docker-php-ext-enable lzf

RUN pecl install zstd \
    && rm -rf /tmp/pear \
    && docker-php-ext-enable zstd

ADD valkey.ini /usr/local/etc/php/conf.d/valkey.ini

CMD ["php-fpm", "-y", "/usr/local/etc/php-fpm.conf", "-R"]