#!/bin/sh

set -x

cd /opt/dist

apk update
apk add make gcc perl musl-dev openssl

wget https://github.com/wg/wrk/archive/4.0.2.tar.gz
apk del openssl

tar zxvf *.tar.gz
cd wrk-*

make -j4
cp wrk /usr/local/bin/

apk del make gcc perl musl-dev

cd /
rm -rf /opt/dist
rm -rf /var/cache/apk/*

