#!/bin/sh

set -x

cd /opt/dist

mv /etc/apk/repositories /etc/apk/repositories.back

cat > /etc/apk/repositories <<EOF
http://mirrors.ustc.edu.cn/alpine/v3.4/main/
http://mirrors.ustc.edu.cn/alpine/v3.4/community/
EOF

apk update
apk add haproxy openssl bash s6

rm -rf /opt/dist
rm -rf /var/cache/apk/*
mv /etc/apk/repositories.back /etc/apk/repositories 

