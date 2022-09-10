#!/bin/sh
docker stop squid
docker rm squid
rm -f squid.key squid.crt
