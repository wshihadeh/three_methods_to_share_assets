FROM wshihadeh/rails-base-image-ruby:2.6.5-mysql

LABEL maintainer="Al-waleed Shihadeh <wshihadeh.dev@gmail.com>"

COPY ./docker-entrypoint.sh /
ENTRYPOINT ["/docker-entrypoint.sh"]

USER rails
WORKDIR /application

RUN bundle config build.nokogiri --use-system-libraries && \
    bundle config git.allow_insecure true && \
    bundle config set deployment 'true' && \
    bundle config set frozen 'true' && \
    bundle config set without 'development test' && \
    bundle install --quiet && \
    bundle exec rake assets:precompile && \
    mkdir tmp/pids && \
    rm -rf vendor/cache/*.gem

CMD web
