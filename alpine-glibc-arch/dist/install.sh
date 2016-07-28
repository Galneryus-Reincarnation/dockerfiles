#!/bin/sh

set -x

cd /opt/dist

cat > /etc/ld.so.conf <<EOF
/usr/glibc/lib
/usr/lib
/lib
EOF

cat > /etc/nsswitch.conf <<EOF
hosts: files dns
EOF

apk update
apk add xz bash git s6 execline openssl curl libarchive-tools

wget http://mirrors.us.kernel.org/archlinux/core/os/x86_64/glibc-2.23-5-x86_64.pkg.tar.xz
tar Jxvf glibc-*.pkg.tar.xz

rm -rf usr/lib/*/ usr/lib/*.a usr/lib/*.o
mkdir -p /usr/glibc/bin /lib64
mv usr/lib /usr/glibc/
mv usr/bin/ldconfig /usr/glibc/bin/
ln -sv /usr/glibc/lib/ld-linux-x86-64.so.2 /lib64/
/usr/glibc/bin/ldconfig


rm -rf /opt/dist
rm -rf /var/cache/apk/*

