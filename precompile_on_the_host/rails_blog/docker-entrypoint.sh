#!/bin/sh

set -e

bundle exec rails db:migrate

case $1 in

  web)
    exec bundle exec puma -C config/puma.rb
  ;;

  *)
    exec "$@"
  ;;

esac

exit 0
