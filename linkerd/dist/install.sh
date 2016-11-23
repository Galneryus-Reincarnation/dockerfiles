#!/bin/sh

set -x

BIN_DIR=/usr/local/bin

wget https://github.com/BuoyantIO/linkerd/releases/download/0.8.3/linkerd-0.8.3-exec -O $BIN_DIR/linkerd
wget https://github.com/BuoyantIO/linkerd/releases/download/0.8.3/namerd-0.8.3-exec -O $BIN_DIR/namerd
mkdir /opt/linkerd/plugins

chmod +x $BIN_DIR/*

cd /
rm -rf /opt/dist

