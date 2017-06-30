#!/bin/sh

set -x
cd /opt/dist

echo 'Server = http://ftp.tsukuba.wide.ad.jp/Linux/archlinux/$repo/os/$arch' | tee /etc/pacman.d/mirrorlist

pacman -Syy
pacman -S --noconfirm python2 base-devel wget perf cmake gcc
rm -rf /var/cache/pacman/pkg/

wget https://aur.archlinux.org/cgit/aur.git/snapshot/jdk.tar.gz -O jdk.tar.gz
bsdtar jdk.tar.gz && pushd jdk && makepkg -si --noconfirm && popd

## perf agent
cd /opt
git clone https://github.com/jrudolph/perf-map-agent.git
cd perf-map-agent

rm -rf /opt/dist
