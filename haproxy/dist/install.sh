#!/bin/sh

set -x

cd /opt/dist

apk add --no-cache haproxy openssl libressl bash

rm -rf /opt/dist
rm -rf /var/cache/apk/*
