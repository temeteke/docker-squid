#!/bin/sh
docker build -t squid ..
openssl req -x509 -nodes -new -keyout squid.key -out squid.crt -days 365 -subj /CN=localhost
docker run -d --name squid -p 3128:3128 -v $PWD/squid.conf:/etc/squid/squid.conf -v $PWD/squid.key:/etc/squid/squid.key -v $PWD/squid.crt:/etc/squid/squid.crt squid
