#!/bin/sh

set -x

cd /opt/dist

git clone https://github.com/xtaci/kcptun

wget https://storage.googleapis.com/golang/go1.7.4.linux-amd64.tar.gz

tar zxvf go*.tar.gz
mkdir data

export GOROOT=`pwd`/go
export GOPATH=`pwd`/data
export PATH=$GOROOT/bin:$GOPATH/bin:$PATH

export CGO_ENABLED=0

cd kcptun

cd client; go get; go build; cd ..
cd server; go get; go build; cd ..

mv client/client server/server /opt/

cd /
rm -rf /opt/dist
