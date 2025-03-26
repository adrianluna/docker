FROM nginx:stable-alpine

ENV NGINXUSER=aluna
ENV NGINXGROUP=aluna

RUN mkdir -p /var/www/html/

ADD nginx/default.conf /etc/nginx/conf.d/default.conf
ADD nginx/vhosts /etc/nginx/conf.d/vhosts/

RUN sed -i "s/user www-data/user ${NGINXUSER}/g" /etc/nginx/nginx.conf

RUN adduser -g ${NGINXGROUP} -s /bin/sh -D ${NGINXUSER}