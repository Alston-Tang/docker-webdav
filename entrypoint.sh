#!/bin/sh -eux

if [ -n "${WEBDAV_USERNAME:-}" ] && [ -n "${WEBDAV_PASSWORD:-}" ]; then
    htpasswd -cb /etc/nginx/webdavpasswd $WEBDAV_USERNAME $WEBDAV_PASSWORD
else
    echo "No htpasswd config done"
    sed -i 's%auth_basic "Restricted";% %g' /etc/nginx/nginx.conf
    sed -i 's%auth_basic_user_file webdavpasswd;% %g' /etc/nginx/nginx.conf
fi

if [ ! -n "${WEBDAV_PORT:-}" ]; then
    WEBDAV_PORT=8080
fi

echo "Listen to port ${WEBDAV_PORT}"
sed -i "s%listen 8080 default_server;%listen ${WEBDAV_PORT} default_server;%g" /etc/nginx/nginx.conf

cat /etc/nginx/nginx.conf
	    

if [ -n "${UID:-}" ]; then
    chmod go+w /dev/stderr /dev/stdout
    exec gosu $UID "$@"
else
    exec "$@"
fi
