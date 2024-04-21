#!/usr/bin/env bash

echo "  Setup Nginx Configuration File(s) ..."

if [[ "${NGINX_ENABLED}" == "true" ]]; then

  echo -e "    Configure Nginx ..."

  OUTDIR="/app/etc/nginx/sites-enabled /app/var/run/nginx /app/var/cache/nginx/fcgi /app/var/tmp/client /app/var/tmp/scgi /app/var/tmp/fastcgi /app/var/tmp/uwsgi /app/var/tmp/scgi"
  mkdir -p $OUTDIR

  apply-template /app/config/nginx/sites-enabled /app/etc/nginx/sites-enabled

else

  echo -e "    > Nginx is not enabled.  No configuration must be done."

fi

true
