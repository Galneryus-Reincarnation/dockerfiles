#!/bin/sh

set -x
cd /opt/dist

wget http://artifacts.aerospike.com/aerospike-tools/3.13.0.1/aerospike-tools-3.13.0.1-el7.tgz -O astools.tgz
bsdtar xvf astools.tgz
cd aerospike-tools-*/
./asinstall

cd ..
rm -rf astools.tgz aerospike-tools-*/

