#!/bin/sh

set -x

BIN_DIR=/usr/local/bin

wget https://github.com/BuoyantIO/linkerd/releases/download/0.8.1/linkerd-0.8.1-exec -O $BIN_DIR/linkerd
wget https://github.com/BuoyantIO/linkerd/releases/download/0.8.1/namerd-0.8.1-exec -O $BIN_DIR/namerd

chmod +x $BIN_DIR/*

cd /
rm -rf /opt/dist

