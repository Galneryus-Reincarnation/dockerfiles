#!/bin/sh

set -x

cd /opt/dist

wget ftp://ftp.infradead.org/pub/ocserv/ocserv-0.11.3.tar.xz


apk update
apk add gcc make musl-dev nettle-dev gnutls-dev libev-dev readline-dev linux-headers lz4 libnl3-dev

tar Jxvf ocserv-*.tar.xz
cd ocserv-*/
./configure
make
make install

cd /
rm -rf /opt/dist
rm -rf /var/cache/apk/*

