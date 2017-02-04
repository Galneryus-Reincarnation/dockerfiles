#!/bin/sh

set -x

cd /opt/dist

curl -OLH "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u121-b13/jdk-8u121-linux-x64.tar.gz
curl -OLH "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jce/8/jce_policy-8.zip

JVM_BASE=/usr/jvm

tar zxvf jdk-*.tar.gz
unzip jce_policy-8.zip

mv jdk1*/ $JVM_BASE
mv UnlimitedJCEPolicyJDK8/*.jar $JVM_BASE/jre/lib/security/

rm     $JVM_BASE/*
rm -rf $JVM_BASE/lib/visualvm
rm -rf $JVM_BASE/lib/missioncontrol

rm     $JVM_BASE/lib/*javafx*
rm     $JVM_BASE/jre/lib/plugin.jar
rm     $JVM_BASE/jre/lib/ext/jfxrt.jar
rm     $JVM_BASE/jre/bin/javaws
rm     $JVM_BASE/jre/lib/javaws.jar
rm -rf $JVM_BASE/jre/lib/desktop
rm -rf $JVM_BASE/jre/plugin
rm -rf $JVM_BASE/jre/lib/deploy*
rm     $JVM_BASE/jre/lib/*javafx*
rm     $JVM_BASE/jre/lib/*jfx*
rm     $JVM_BASE/jre/lib/amd64/libdecora_sse.so
rm     $JVM_BASE/jre/lib/amd64/libprism_*.so
rm     $JVM_BASE/jre/lib/amd64/libfxplugins.so
rm     $JVM_BASE/jre/lib/amd64/libglass.so
rm     $JVM_BASE/jre/lib/amd64/libgstreamer-lite.so
rm     $JVM_BASE/jre/lib/amd64/libjavafx*.so
rm     $JVM_BASE/jre/lib/amd64/libjfx*.so

# set default dns cache to 30 seconds (negative = cache failure)
sed -i 's/^networkaddress.cache/#networkaddress.cache/' $JVM_BASE/jre/lib/security/java.security
cat >> $JVM_BASE/jre/lib/security/java.security <<EOF
networkaddress.cache.ttl=30
networkaddress.cache.negative.ttl=30
EOF


rm -rf /opt/dist

