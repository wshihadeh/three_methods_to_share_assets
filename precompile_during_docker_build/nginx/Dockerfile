FROM wshihadeh/rails_blog:master


From nginx:latest
LABEL maintainer="Al-waleed <wshihadeh.dev@gmail.com>"

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

COPY ./default.conf /etc/nginx/conf.d/default.conf
COPY ./nginx.conf /etc/nginx/nginx.conf

RUN mkdir /var/www/
WORKDIR /var/www/

COPY --from=0 /application/public public/
