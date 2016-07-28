#!/bin/sh

set -x

cd /opt/dist


apk update
apk add perl make gcc openssl pcre readline libgcc \
  openssl-dev pcre-dev musl-dev \
  s6 execline bash


_OPENRESTY_VERSION='1.9.15.1'

test -f openresty-$_OPENRESTY_VERSION.tar.gz ||  wget https://openresty.org/download/openresty-$_OPENRESTY_VERSION.tar.gz
tar zxvf openresty-$_OPENRESTY_VERSION.tar.gz
rm -rf openresty-$_OPENRESTY_VERSION.tar.gz

cd openresty-$_OPENRESTY_VERSION

./configure \
  --prefix=/opt/openresty \
  --with-pcre-jit \
  --with-ipv6 \
  --with-http_ssl_module \
  --with-luajit
make install -j4

apk del perl make gcc openssl-dev pcre-dev musl-dev
rm -rf /opt/dist
rm -rf /var/cache/apk/*

