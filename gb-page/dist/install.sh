#!/bin/sh

set -x

cd /opt/dist

git clone https://github.com/gitbucket/gitbucket-pages-plugin.git
wget https://github.com/paulp/sbt-extras/raw/master/sbt -O /usr/local/bin/sbt
chmod +x /usr/local/bin/sbt

cd gitbucket-pages-plugin
sbt package
