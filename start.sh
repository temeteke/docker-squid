#!/bin/sh
chown squid:squid /dev/stdout

openssl req -x509 -nodes -new -keyout /etc/squid/squid.key -out /etc/squid/squid.crt -days 365 -subj /CN=localhost

rm -rf /var/cache/squid/ssl_db
/usr/lib/squid/security_file_certgen -c -s /var/cache/squid/ssl_db -M 4MB
chown squid:squid -R /var/cache/squid/ssl_db

exec squid -N
