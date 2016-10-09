#!/bin/sh

set -x

BIN_DIR=/usr/local/bin
wget https://github.com/BuoyantIO/linkerd/releases/download/0.8.1/namerd-0.8.1-exec -O $BIN_DIR/namerd
chmod +x $BIN_DIR/namerd
# TODO add namerctl: https://github.com/BuoyantIO/namerctl


cd /
rm -rf /opt/dist

