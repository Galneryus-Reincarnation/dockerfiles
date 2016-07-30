#!/bin/sh

set -x

cd /opt/dist

# sed -i 's#dl-cdn.alpinelinux.org#mirrors.ustc.edu.cn#' /etc/apk/repositories
# wget http://192.168.3.158:8000/unix/ocserv-0.11.3.tar.xz

wget http://pkgs.fedoraproject.org/repo/pkgs/ocserv/ocserv-0.11.3.tar.xz/ffe3d79662e939bb55dfe7c9e490b4f2/ocserv-0.11.3.tar.xz
# wget ftp://ftp.infradead.org/pub/ocserv/ocserv-0.11.3.tar.xz

apk update
#apk add alpine-sdk automake
apk add gcc make musl-dev nettle-dev gnutls-dev libev-dev readline-dev linux-headers lz4-dev libnl3-dev

tar Jxvf ocserv-*.tar.xz
cd ocserv-*/
./configure
make
make install

apk del gcc make musl-dev nettle-dev gnutls-dev libev-dev readline-dev linux-headers lz4-dev libnl3-dev
apk add gnutls gnutls-c++ libev libffi libgmpxx libnl3 libnl3-cli libtasn1 lz4 ncurses-libs ncurses-terminfo ncurses-terminfo-base nettle p11-kit readline

cd /
rm -rf /opt/dist
rm -rf /var/cache/apk/*

