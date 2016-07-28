#!/bin/sh

set -x

cd /opt/dist

mv /etc/apk/repositories /etc/apk/repositories.back

cat > /etc/apk/repositories <<EOF
http://mirrors.ustc.edu.cn/alpine/v3.3/main/
http://mirrors.ustc.edu.cn/alpine/v3.3/community/
EOF

apk update
apk add mariadb mariadb-client bash s6

mkdir /etc/mysql/conf.d /run/mysqld/
mv /etc/mysql/my.cnf /etc/mysql/my.cnf.back
cat > /etc/mysql/my.cnf <<EOF
[mysqld]
user = root
datadir = /var/lib/mysql
port = 3306
log-bin = /var/lib/mysql/mysql-bin
!includedir /etc/mysql/conf.d/
EOF

rm -rf /opt/dist
rm -rf /var/cache/apk/*
mv /etc/apk/repositories.back /etc/apk/repositories 

