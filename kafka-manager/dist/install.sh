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

echo 'http.port = ${KM_HTTP_PORT}'            >> /opt/kafka-manager/conf/application.conf
echo 'kafka-manager.zkhosts= ${KM_ZK_HOSTS}'  >> /opt/kafka-manager/conf/application.conf
sed -i '/ref="ASYNCFILE"/d'                 /opt/kafka-manager/conf/logback.xml
sed -i 's/ref="ASYNCSTDOUT"/ref="STDOUT"/'  /opt/kafka-manager/conf/logback.xml
rm /opt/kafka-manager/conf/logger.xml

cd /
rm -rf /opt/dist
rm -rf $HOME/.sbt $HOME/.ivy2

