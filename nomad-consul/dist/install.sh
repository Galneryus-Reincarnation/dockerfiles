#!/bin/sh

set -x

cd /opt/dist

wget https://releases.hashicorp.com/consul/0.7.1/consul_0.7.1_linux_amd64.zip               -O consul.zip
wget https://releases.hashicorp.com/consul/0.7.1/consul_0.7.1_web_ui.zip                    -O consul_web.zip
wget https://github.com/iverberk/nomad-ui/releases/download/v0.3.1/nomad-ui-linux-amd64     -O nomad-ui
wget https://releases.hashicorp.com/nomad/0.4.1/nomad_0.4.1_linux_amd64.zip                 -O nomad.zip

mv nomad-ui /opt
for f in *.zip; do
    bsdtar xf $f -C /opt
done

cd /opt
chmod +x *

cd /
rm -rf /opt/dist

