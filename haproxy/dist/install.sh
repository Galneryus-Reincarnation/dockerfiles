#!/bin/sh

set -x

cd /opt/dist

apk update
apk add haproxy openssl libressl bash

rm -rf /opt/dist
rm -rf /var/cache/apk/*
