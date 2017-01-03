#!/bin/sh

set -x

cd /opt/dist

apk add --no-cache alpine-sdk

wget http://people.seas.harvard.edu/~apw/stress/stress-1.0.4.tar.gz

tar zxvf *.tar.gz
cd stress-*/

./configure
make
cp src/stress /usr/local/bin/

apk del alpine-sdk

cd /
rm -rf /opt/dist
rm -rf /var/cache/apk/*

