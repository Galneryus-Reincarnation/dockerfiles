#!/bin/sh

set -x

cd /opt/dist

curl -OLH "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/10.0.1+10/fb4372174a714e6b8c52526dc134031e/jdk-10.0.1_linux-x64_bin.rpm
JVM_BASE=/usr/java/latest

rpm -Uvh *.rpm


rm -rf  $JVM_BASE/lib/missioncontrol
rm      $JVM_BASE/lib/src.zip

# dns cache
sed -i 's/^networkaddress.cache/#networkaddress.cache/' $JVM_BASE/conf/security/java.security
cat >> $JVM_BASE/conf/security/java.security <<EOF
networkaddress.cache.ttl=30
networkaddress.cache.negative.ttl=30
EOF

rm -rf /opt/dist

