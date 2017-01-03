#!/bin/sh

set -x

cd /opt/dist

apk add --no-cache nginx libressl bash

rm -rf /opt/dist
rm -rf /var/cache/apk/*

