#!/bin/sh

set -x

cd /opt/dist

# sed -i 's#dl-cdn.alpinelinux.org#mirrors.ustc.edu.cn#' /etc/apk/repositories

wget http://pkgs.fedoraproject.org/repo/pkgs/ocserv/ocserv-0.11.8.tar.xz/sha512/cea5ef084a15de1e16c0d55f418f454f32c77e4303246f3d11e71ddbc7dbea028282b8200b59a49f5509e786970749b0a9795262639209924bbaa1d619c5c25c/ocserv-0.11.8.tar.xz
# wget ftp://ftp.infradead.org/pub/ocserv/ocserv-0.11.3.tar.xz

#apk add --no-cache alpine-sdk automake
apk add --no-cache gcc make musl-dev nettle-dev gnutls-dev libev-dev readline-dev linux-headers lz4-dev libnl3-dev talloc-dev

tar Jxvf ocserv-*.tar.xz
cd ocserv-*/
./configure
make
make install

apk del gcc make musl-dev nettle-dev gnutls-dev libev-dev readline-dev linux-headers lz4-dev libnl3-dev talloc-dev
apk add --no-cache gnutls gnutls-c++ libev libffi libgmpxx libnl3 libnl3-cli libtasn1 lz4 ncurses-libs ncurses-terminfo ncurses-terminfo-base nettle p11-kit readline talloc

cd /
rm -rf /opt/dist
rm -rf /var/cache/apk/*

