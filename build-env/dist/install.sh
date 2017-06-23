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

wget https://github.com/knq/usql/releases/download/v0.5.0/usql-0.5.0-linux-amd64.tar.bz2    -O usql.bz2
wget https://github.com/iverberk/nomad-ui/releases/download/v0.3.1/nomad-ui-linux-amd64     -O $BIN_DIR/nomad-ui
wget https://releases.hashicorp.com/consul/0.7.1/consul_0.7.1_linux_amd64.zip               -O consul.zip
wget https://releases.hashicorp.com/nomad/0.4.1/nomad_0.4.1_linux_amd64.zip                 -O nomad.zip
wget https://dl.minio.io/client/mc/release/linux-amd64/mc                                   -O $BIN_DIR/mc
wget https://dl.minio.io/server/minio/release/linux-amd64/minio                             -O $BIN_DIR/minio
wget https://github.com/astaxie/bat/releases/download/v0.0.1/bat_0.0.1_linux_amd64.tar.gz   -O bat.tar.gz
wget https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64                     -O $BIN_DIR/jq
#wget https://releases.hashicorp.com/consul/0.7.1/consul_0.7.1_web_ui.zip                    -O consul_web.zip


for f in consul.zip nomad.zip usql.bz2 bat.tar.gz; do
    bsdtar xvf $f
done

mv consul nomad usql $BIN_DIR/
mv bat_*/bat $BIN_DIR/

chmod +x $BIN_DIR/*
rm -rf /opt/dist

