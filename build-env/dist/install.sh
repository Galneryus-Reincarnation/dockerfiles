#!/bin/sh

set -x
cd /opt/dist


pacman -Syy
pacman -S --noconfirm jdk8-openjdk python2 base-devel wget
rm -rf /var/cache/pacman/pkg/

wget https://aur.archlinux.org/cgit/aur.git/snapshot/jdk.tar.gz -O jdk.tar.gz
bsdtar jdk.tar.gz && pushd jdk && makepkg -si --noconfirm && popd

#### TOOLS

BIN_DIR=/usr/local/bin
wget wget https://dl.minio.io/client/mc/release/linux-amd64/mc  -O $BIN_DIR/mc
chmod +x $BIN_DIR/*
rm -rf /opt/dist
