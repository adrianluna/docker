## Start servers

docker-compose up

## Run artisan migrate on a laravel project

docker-compose run --rm artisan testing-laravel/artisan migrate

## Connect to valkey-cli

docker-compose run --rm valkey valkey-cli -h valkey

## How to execute bin on php container:

docker-compose run --rm -it php /bin/sh

## Build container

docker-compose -f docker-compose.yml up --build php

## Run php script

docker-compose run --rm php valkey-php/tests/TestRedis.php --class Redis

## Enter shell on a running container
docker exec -it docker-php-1 sh

## Execute valkey tests

php tests/TestRedis.php --class Redis --host valkey


## CONFIGURE AND BUILD VALKEY

cd valkey-php
phpize
./configure --enable-redis-igbinary --enable-redis-msgpack --enable-redis-lzf --with-liblzf --enable-redis-zstd --with-libzstd --enable-redis-lz4 --with-liblz4
make
make install

# Connect to valkey using TLS
docker run --volume /Users/adrianluna/Code/docker/certs:/etc/certs --rm valkey/valkey valkey-cli -h valkey --tls \
    --cacert /etc/certs/ca.cert

docker-compose run --rm valkey valkey-cli -h valkey --tls \
    --cert /Users/adrianluna/Code/docker/certs/client.crt \
    --key /Users/adrianluna/Code/docker/certs/client.key \
    --cacert /Users/adrianluna/Code/docker/certs/ca.cert


docker-compose run --rm redis redis-cli -h redis --tls \
    --cert /Users/adrianluna/Code/docker/certs/redis.crt \
    --key /Users/adrianluna/Code/docker/certs/redis.key \
    --cacert /Users/adrianluna/Code/docker/certs/ca.cert