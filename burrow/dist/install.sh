#!/bin/sh

set -x

cd /opt/dist

apk add --no-cache git go alpine-sdk

git clone https://github.com/linkedin/Burrow
export GOPATH=/opt/dist/gopath
export GOROOT=/usr/lib/go
mkdir $GOPATH

cd Burrow
go get
go build
mv Burrow /opt

apk del git go alpine-sdk
rm -rf /opt/dist
rm -rf /var/cache/apk/*

