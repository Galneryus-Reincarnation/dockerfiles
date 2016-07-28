#!/bin/sh

set -x

cd /opt/dist

#http://www.aerospike.com/download/tools/3.9.0/artifact/el7
#http://www.aerospike.com/artifacts/aerospike-tools/3.9.0/aerospike-tools-3.9.0-el7.tgz

VER='3.8.4'
curl -OL http://www.aerospike.com/artifacts/aerospike-tools/${VER}/aerospike-tools-${VER}-el7.tgz

tar zxvf aerospike-tools-*.tgz
cd aerospike-tools-*/
./asinstall

cd /
rm -rf /opt/dist

