#!/bin/sh
curl -x http://localhost:3128 --cacert squid.crt https://temeteke.com
docker logs squid
