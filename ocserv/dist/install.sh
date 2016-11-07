#!/bin/sh

set -x

cd /opt/dist

# sed -i 's#dl-cdn.alpinelinux.org#mirrors.ustc.edu.cn#' /etc/apk/repositories

wget http://pkgs.fedoraproject.org/repo/pkgs/ocserv/ocserv-0.11.5.tar.xz/fbda999ce0b528d001bb46b3db6f5d49/ocserv-0.11.5.tar.xz
# wget ftp://ftp.infradead.org/pub/ocserv/ocserv-0.11.3.tar.xz

apk update
#apk add alpine-sdk automake
apk add gcc make musl-dev nettle-dev gnutls-dev libev-dev readline-dev linux-headers lz4-dev libnl3-dev talloc-dev

tar Jxvf ocserv-*.tar.xz
cd ocserv-*/
./configure
make
make install

apk del gcc make musl-dev nettle-dev gnutls-dev libev-dev readline-dev linux-headers lz4-dev libnl3-dev talloc-dev
apk add gnutls gnutls-c++ libev libffi libgmpxx libnl3 libnl3-cli libtasn1 lz4 ncurses-libs ncurses-terminfo ncurses-terminfo-base nettle p11-kit readline talloc

cd /
rm -rf /opt/dist
rm -rf /var/cache/apk/*

