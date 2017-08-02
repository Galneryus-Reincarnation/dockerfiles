#!/bin/sh

set -x
cd /opt/dist

wget https://packages.couchbase.com/releases/3.0.1/couchbase-server-community-3.0.1-centos6.x86_64.rpm -O couchbase.rpm
bsdtar xvf couchbase.rpm

mkdir -p /usr/local/couchbase/{lib,bin}
cp -r opt/couchbase/lib/python /usr/local/couchbase/lib/
cp opt/couchbase/bin/couchbase-cli /usr/local/couchbase/bin

rm -rf couchbase.rpm opt etc
