#!/bin/sh
chown squid:squid /var/cache/squid
if [ ! -d /var/cache/squid/00 ]; then
	squid -zN
fi

rm -rf /var/cache/squid/ssl_db
/usr/lib/squid/security_file_certgen -c -s /var/cache/squid/ssl_db -M 4MB
chown squid:squid -R /var/cache/squid/ssl_db

chown squid:squid /dev/stdout

exec squid -N
