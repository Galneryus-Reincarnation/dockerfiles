#!/bin/sh

set -x

cd /opt/dist

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

for f in *.zip; do
    bsdtar xf $f -C /opt
done


chmod +x $BIN_DIR/*

rm -rf /opt/dist

