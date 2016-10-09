#!/bin/sh

set -x

BIN_FILE=/usr/local/bin/namerd
wget https://github.com/BuoyantIO/linkerd/releases/download/0.8.1/namerd-0.8.1-exec -O $BIN_FILE
chmod +x $BIN_FILE
# TODO add namerctl: https://github.com/BuoyantIO/namerctl


cd /
rm -rf /opt/dist

