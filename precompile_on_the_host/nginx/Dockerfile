From nginx:latest

LABEL maintainer="Al-waleed <wshihadeh.dev@gmail.com>"

COPY ./nginx/docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

COPY ./nginx/default.conf /etc/nginx/conf.d/default.conf
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf

RUN mkdir /var/www/
WORKDIR /var/www/

COPY ./rails_blog/public public/
