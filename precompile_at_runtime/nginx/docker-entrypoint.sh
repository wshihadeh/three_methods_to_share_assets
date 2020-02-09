#!/bin/bash -e

case $1 in

  server)
    nginx -g 'daemon off;'
  ;;

  test)
    nginx -c /etc/nginx/nginx.conf -t
  ;;

  show_config)
    nginx -c /etc/nginx/nginx.conf -T
  ;;

  *)
    exec "$@"
  ;;

esac

exit 0
