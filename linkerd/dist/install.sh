#!/bin/sh

set -x

BIN_FILE=/usr/local/bin/linkerd
wget https://github.com/BuoyantIO/linkerd/releases/download/0.7.5/linkerd-0.7.5-exec -O $BIN_FILE
chmod +x $BIN_FILE

cd /
rm -rf /opt/dist

