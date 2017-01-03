#!/bin/sh

set -x

cd /opt/dist

apk add --no-cache make gcc perl musl-dev openssl-dev openssl libgcc

wget https://github.com/wg/wrk/archive/4.0.2.tar.gz

tar zxvf *.tar.gz
cd wrk-*

WITH_OPENSSL=no make -j4
cp wrk /usr/local/bin/

apk del make gcc perl musl-dev openssl-dev

cd /
rm -rf /opt/dist
rm -rf /var/cache/apk/*

