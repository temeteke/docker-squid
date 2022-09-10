#!/bin/sh
docker build -t squid ..
touch squid.crt
docker run -d --name squid -p 3128:3128 -v $PWD/squid.conf:/etc/squid/squid.conf -v $PWD/squid.crt:/etc/squid/squid.crt squid
