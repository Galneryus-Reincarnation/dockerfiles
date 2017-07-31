#!/bin/sh

set -x
cd /opt/dist

wget https://github.com/paulp/sbt-extras/raw/master/sbt -O /usr/local/bin/sbt
chmod +x /usr/local/bin/sbt
