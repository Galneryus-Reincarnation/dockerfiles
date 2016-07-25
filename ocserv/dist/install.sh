#!/bin/sh

set -x

cd /opt/dist

wget ftp://ftp.infradead.org/pub/ocserv/ocserv-0.11.3.tar.xz

apk update
apk add musl-dev iptables gnutls-dev readline-dev libnl3-dev lz4-dev libseccomp-dev libev-dev \
    xz openssl gcc autoconf make linux-headers

tar Jxvf ocserv-*.tar.xz
cd ocserv-*/
./configure
make
make install

cd /
rm -rf /opt/dist
rm -rf /var/cache/apk/*

