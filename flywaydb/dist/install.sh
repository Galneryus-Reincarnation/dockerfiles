#!/bin/sh

set -x

cd /opt/dist

# TODO switch to https
wget http://repo1.maven.org/maven2/org/flywaydb/flyway-commandline/4.0.2/flyway-commandline-4.0.2.tar.gz

tar zxvf flyway-commandline*
rm *
mv flyway-* /opt/flyway

rm -rf /opt/dist

