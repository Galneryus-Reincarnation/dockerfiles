#!/bin/sh

# TODO: llvm (scala-native dependencies)

set -x
cd /opt/dist

echo 'Server = http://ftp.tsukuba.wide.ad.jp/Linux/archlinux/$repo/os/$arch' | tee /etc/pacman.d/mirrorlist
#echo 'Server = https://mirrors.kernel.org/archlinux/$repo/os/$arch' | tee /etc/pacman.d/mirrorlist

pacman -Syy
pacman -S --noconfirm python2 base-devel wget perf cmake git
pacman -S --noconfirm --asdeps ca-certificates-java hicolor-icon-theme java-environment-common java-runtime-common nss xdg-utils
rm -rf /var/cache/pacman/pkg/

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


## perf agent
cd /opt
wget https://github.com/jvm-profiling-tools/perf-map-agent/archive/master.tar.gz -O perf-map-agent.tar.gz
wget https://github.com/brendangregg/FlameGraph/archive/master.tar.gz            -O FlameGrap.tar.gz
wget https://github.com/jvm-profiling-tools/async-profiler/archive/master.tar.gz -O async-profiler.tar.gz

for x in *.tar.gz;
do
    bsdtar xvf $x
done

cd /opt/perf-map-agent-master
cmake .
make

cd /opt/async-profiler-master
make

rm -rf /opt/dist /opt/*.tar.gz
