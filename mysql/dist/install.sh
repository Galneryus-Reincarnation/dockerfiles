#!/bin/sh

set -x

cd /opt/dist

apk add --no-cache mariadb mariadb-client bash s6

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

