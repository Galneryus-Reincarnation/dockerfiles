#!/bin/sh

set -xe

cd /opt/dist

git clone https://github.com/yahoo/kafka-manager.git

cd kafka-manager

wget https://github.com/paulp/sbt-extras/raw/master/sbt -O sbt
chmod +x sbt

./sbt dist

unzip target/universal/kafka-manager-*.zip -d /opt
mv /opt/kafka-manager-* /opt/kafka-manager
rm -rf /opt/kafka-manager/share

cd /
rm -rf /opt/dist
rm -rf $HOME/.sbt $HOME/.ivy2

