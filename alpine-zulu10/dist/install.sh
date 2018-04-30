#!/bin/sh

set -x

cd /opt/dist

curl -OL https://cdn.azul.com/zulu/bin/zulu10.1+11-jdk10-linux_x64.tar.gz

JVM_BASE=/usr/jvm

tar zxvf zulu*.tar.gz

mv zulu*/ $JVM_BASE

rm  $JVM_BASE/*
rm  $JVM_BASE/demo
rm  $JVM_BASE/legal

# dns cache
sed -i 's/^networkaddress.cache/#networkaddress.cache/' $JVM_BASE/conf/security/java.security
cat >> $JVM_BASE/conf/security/java.security <<EOF
networkaddress.cache.ttl=30
networkaddress.cache.negative.ttl=30
EOF

rm -rf /opt/dist

