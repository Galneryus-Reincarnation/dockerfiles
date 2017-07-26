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

rm     $JAVA_HOME/*
rm -rf $JAVA_HOME/lib/visualvm
rm -rf $JAVA_HOME/lib/missioncontrol

rm     $JAVA_HOME/lib/*javafx*
rm     $JAVA_HOME/jre/lib/plugin.jar
rm     $JAVA_HOME/jre/lib/ext/jfxrt.jar
rm     $JAVA_HOME/jre/bin/javaws
rm     $JAVA_HOME/jre/lib/javaws.jar
rm -rf $JAVA_HOME/jre/lib/desktop
rm -rf $JAVA_HOME/jre/plugin
rm -rf $JAVA_HOME/jre/lib/deploy*
rm     $JAVA_HOME/jre/lib/*javafx*
rm     $JAVA_HOME/jre/lib/*jfx*
rm     $JAVA_HOME/jre/lib/amd64/libdecora_sse.so
rm     $JAVA_HOME/jre/lib/amd64/libprism_*.so
rm     $JAVA_HOME/jre/lib/amd64/libfxplugins.so
rm     $JAVA_HOME/jre/lib/amd64/libglass.so
rm     $JAVA_HOME/jre/lib/amd64/libgstreamer-lite.so
rm     $JAVA_HOME/jre/lib/amd64/libjavafx*.so
rm     $JAVA_HOME/jre/lib/amd64/libjfx*.so

