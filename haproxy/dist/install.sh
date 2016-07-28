#!/bin/sh

set -x

cd /opt/dist

apk update
apk add haproxy openssl bash s6

rm -rf /opt/dist
rm -rf /var/cache/apk/*
