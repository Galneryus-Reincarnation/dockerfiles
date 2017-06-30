#!/bin/sh

set -x
cd /opt/dist

echo 'Server = http://ftp.tsukuba.wide.ad.jp/Linux/archlinux/$repo/os/$arch' | tee /etc/pacman.d/mirrorlist

pacman -Syy
pacman -S --noconfirm python2 base-devel wget perf cmake
rm -rf /var/cache/pacman/pkg/

wget https://aur.archlinux.org/cgit/aur.git/snapshot/jdk.tar.gz -O jdk.tar.gz
bsdtar jdk.tar.gz && pushd jdk && makepkg -si --noconfirm && popd

## perf agent
cd /opt
wget https://github.com/jvm-profiling-tools/perf-map-agent/archive/master.tar.gz -O perf-map-agent.tar.gz
wget https://github.com/brendangregg/FlameGraph/archive/master.tar.gz -O FlameGrap.tar.gz

for x in *.tar.gz:
do
    tar zxvf $x
done

cd perf-map-agent-master
cmake .
make

rm -rf /opt/dist
