#!/bin/sh

set -x

BIN_DIR=/usr/local/bin

wget https://dl.minio.io/client/mc/release/linux-amd64/mc       -O $BIN_DIR/mc
wget https://dl.minio.io/server/minio/release/linux-amd64/minio -O $BIN_DIR/minio

chmod +x $BIN_DIR/*

cd /
rm -rf /opt/dist

