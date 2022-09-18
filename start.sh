#!/bin/sh
chown squid:squid /dev/stdout

rm -rf /var/cache/squid/ssl_db
/usr/lib/squid/security_file_certgen -c -s /var/cache/squid/ssl_db -M 4MB
chown squid:squid -R /var/cache/squid

exec squid -zN
