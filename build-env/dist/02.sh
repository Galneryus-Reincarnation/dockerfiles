#!/bin/sh

set -x
cd /opt/dist

curl -OLH "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/jdk-8u144-linux-x64.rpm
rpm -Uvh *.rpm

curl -OLH "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip
unzip jce_policy-8.zip
mv UnlimitedJCEPolicyJDK8/* $JAVA_HOME/jre/lib/security/

# dns cache
sed -i 's/^networkaddress.cache/#networkaddress.cache/' $JAVA_HOME/jre/lib/security/java.security
cat >> $JAVA_HOME/jre/lib/security/java.security <<EOF
networkaddress.cache.ttl=30
networkaddress.cache.negative.ttl=30
EOF

