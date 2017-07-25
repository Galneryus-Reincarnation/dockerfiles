#!/bin/sh

set -x
cd /opt/dist

wget https://aur.archlinux.org/cgit/aur.git/snapshot/jdk.tar.gz -O jdk.tar.gz
bsdtar xvf jdk.tar.gz
cd jdk
chmod og+w .

touch PKGBUILD_
echo "PKGEXT='.pkg.tar'" >> PKGBUILD_
cat PKGBUILD >> PKGBUILD_
mv PKGBUILD_ PKGBUILD

sudo -u nobody makepkg
pacman -U --noconfirm *.pkg.tar

# dns cache
sed -i 's/^networkaddress.cache/#networkaddress.cache/' $JAVA_HOME/jre/lib/security/java.security
cat >> $JAVA_HOME/jre/lib/security/java.security <<EOF
networkaddress.cache.ttl=30
networkaddress.cache.negative.ttl=30
EOF

rm     $JVM_HOME/*
rm -rf $JVM_HOME/lib/visualvm
rm -rf $JVM_HOME/lib/missioncontrol

rm     $JVM_HOME/lib/*javafx*
rm     $JVM_HOME/jre/lib/plugin.jar
rm     $JVM_HOME/jre/lib/ext/jfxrt.jar
rm     $JVM_HOME/jre/bin/javaws
rm     $JVM_HOME/jre/lib/javaws.jar
rm -rf $JVM_HOME/jre/lib/desktop
rm -rf $JVM_HOME/jre/plugin
rm -rf $JVM_HOME/jre/lib/deploy*
rm     $JVM_HOME/jre/lib/*javafx*
rm     $JVM_HOME/jre/lib/*jfx*
rm     $JVM_HOME/jre/lib/amd64/libdecora_sse.so
rm     $JVM_HOME/jre/lib/amd64/libprism_*.so
rm     $JVM_HOME/jre/lib/amd64/libfxplugins.so
rm     $JVM_HOME/jre/lib/amd64/libglass.so
rm     $JVM_HOME/jre/lib/amd64/libgstreamer-lite.so
rm     $JVM_HOME/jre/lib/amd64/libjavafx*.so
rm     $JVM_HOME/jre/lib/amd64/libjfx*.so

