FROM redis:7.4-alpine

ENV VALKEYUSER=aluna
ENV VALKEYGROUP=aluna

RUN adduser -g ${VALKEYGROUP} -s /bin/sh -D ${VALKEYUSER}