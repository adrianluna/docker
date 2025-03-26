FROM nginx:stable-alpine

ENV NGINXUSER=aluna
ENV NGINXGROUP=aluna

RUN mkdir -p /var/www/html/

ADD nginx/default.prod.conf /etc/nginx/conf.d/default.conf
ADD nginx/vhosts/prod/*.conf /etc/nginx/conf.d/vhosts/prod/

RUN sed -i "s/user www-data/user ${NGINXUSER}/g" /etc/nginx/nginx.conf

RUN adduser -g ${NGINXGROUP} -s /bin/sh -D ${NGINXUSER}