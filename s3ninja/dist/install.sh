#!/bin/sh

set -x

mkdir -p /opt/s3ninja
cd /opt/s3ninja

wget https://repo.maven.apache.org/maven2/com/scireum/s3ninja/2.7/s3ninja-2.7-zip.zip

unzip *.zip
rm -rf *.zip *.exe

rm -rf /opt/dist

