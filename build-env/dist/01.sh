#!/bin/sh

set -x
cd /opt/dist

echo 'Server = http://ftp.tsukuba.wide.ad.jp/Linux/archlinux/$repo/os/$arch' | tee /etc/pacman.d/mirrorlist
#echo 'Server = https://mirrors.kernel.org/archlinux/$repo/os/$arch' | tee /etc/pacman.d/mirrorlist

pacman -Syy
pacman -S --noconfirm python2 base-devel wget perf cmake git
pacman -S --noconfirm --asdeps ca-certificates-java hicolor-icon-theme java-environment-common java-runtime-common nss xdg-utils
rm -rf /var/cache/pacman/pkg/*

