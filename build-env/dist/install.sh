#!/bin/sh

# TODO: llvm (scala-native dependencies)

set -x
cd /opt/dist

echo 'Server = http://ftp.tsukuba.wide.ad.jp/Linux/archlinux/$repo/os/$arch' | tee /etc/pacman.d/mirrorlist

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


## perf agent
cd /opt
wget https://github.com/jvm-profiling-tools/perf-map-agent/archive/master.tar.gz -O perf-map-agent.tar.gz
wget https://github.com/brendangregg/FlameGraph/archive/master.tar.gz -O FlameGrap.tar.gz

for x in *.tar.gz;
do
    bsdtar xvf $x
done

cd perf-map-agent-master
cmake .
make

rm -rf /opt/dist /opt/*.tar.gz
