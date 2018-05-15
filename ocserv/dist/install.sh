#!/bin/sh

set -x

cd /opt/dist

# sed -i 's#dl-cdn.alpinelinux.org#mirrors.ustc.edu.cn#' /etc/apk/repositories

wget https://src.fedoraproject.org/repo/pkgs/ocserv/ocserv-0.12.1.tar.xz/sha512/3fc5e6c6a3b4390cb0ffa78fac4f8e70aa689227c6f5b62180b95f35cf2de0c41075a157412de40866ce1af12ad8feabd87b2b986c8ca09ebee70514da9ec13f/ocserv-0.12.1.tar.xz
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

