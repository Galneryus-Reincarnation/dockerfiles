#!/bin/sh

set -x

cd /opt/dist

apk update
apk add nginx libressl bash

rm -rf /opt/dist
rm -rf /var/cache/apk/*

