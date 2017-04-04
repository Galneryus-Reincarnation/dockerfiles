#!/bin/sh

set -x

cd /opt/dist

# sed -i 's#dl-cdn.alpinelinux.org#mirrors.ustc.edu.cn#' /etc/apk/repositories

wget http://pkgs.fedoraproject.org/repo/pkgs/ocserv/ocserv-0.11.7.tar.xz/sha512/a563725bd8753186ece80c91a237a2940071047bb32d1990e2ee122a32ad0468b78a7f35d422dcc9b968a8c56358992842d00958dbf9d743632a03623dd2f5cf/ocserv-0.11.7.tar.xz
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

