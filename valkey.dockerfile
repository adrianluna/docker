FROM valkey/valkey:8.1-alpine

ENV VALKEYUSER=aluna
ENV VALKEYGROUP=aluna

# ADD valkey/redis.conf /etc/redis.conf ## uncomment if running on sockets

RUN adduser -g ${VALKEYGROUP} -s /bin/sh -D ${VALKEYUSER}

# ENTRYPOINT ["docker-entrypoint.sh", "/etc/redis.conf"] ## uncomment if running on sockets