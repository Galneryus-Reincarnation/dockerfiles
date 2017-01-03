#!/bin/sh

set -x

cd /opt/dist

wget https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-5.1.1-linux-x86_64.tar.gz   -O fb.tar.gz

tar zxvf fb.tar.gz
mv filebeat-*/filebeat /usr/local/bin/

cd /opt
chmod +x *

cd /
rm -rf /opt/dist

