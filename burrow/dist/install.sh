#!/bin/sh

set -x

cd /opt/dist

apk add --no-cache git go alpine-sdk


git clone https://github.com/linkedin/Burrow
export GOPATH=/opt/dist/gopath
export GOROOT=/usr/lib/go
mkdir $GOPATH

cd Burrow
wget https://raw.githubusercontent.com/pote/gpm/v1.4.0/bin/gpm
chmod +x gpm
./gpm install
go get
go build
mv Burrow /opt

apk del git go alpine-sdk
rm -rf /opt/dist
rm -rf /var/cache/apk/*

