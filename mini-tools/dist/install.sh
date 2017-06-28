#!/bin/sh

set -x
cd /opt/dist

BIN_DIR=/usr/local/bin


wget https://releases.hashicorp.com/consul/0.8.4/consul_0.8.4_linux_amd64.zip               -O consul.zip
wget https://releases.hashicorp.com/nomad/0.5.6/nomad_0.5.6_linux_amd64.zip                 -O nomad.zip
wget https://releases.hashicorp.com/vault/0.7.3/vault_0.7.3_linux_amd64.zip                 -O vault.zip
wget https://releases.hashicorp.com/packer/1.0.2/packer_1.0.2_linux_amd64.zip               -O packer.zip
wget https://releases.hashicorp.com/terraform/0.9.8/terraform_0.9.8_linux_amd64.zip         -O terraform.zip
wget https://releases.hashicorp.com/envconsul/0.6.2/envconsul_0.6.2_linux_amd64.zip         -O envconsul.zip
wget https://releases.hashicorp.com/consul-template/0.18.5/consul-template_0.18.5_linux_amd64.zip               -O consul-template.zip
wget https://releases.hashicorp.com/consul-replicate/0.3.1/consul-replicate_0.3.1_linux_amd64.zip               -O consul-replicate.zip
wget https://github.com/hashicorp/consul-migrate/releases/download/v0.1.0/consul-migrate_v0.1.0_linux_amd64.zip -O consul-migrate.zip

wget https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-5.4.3-linux-x86_64.tar.gz -O filebeat.tar.gz
wget https://github.com/knq/usql/releases/download/v0.5.0/usql-0.5.0-linux-amd64.tar.bz2    -O usql.bz2
wget https://github.com/iverberk/nomad-ui/releases/download/v0.3.1/nomad-ui-linux-amd64     -O $BIN_DIR/nomad-ui
wget https://dl.minio.io/client/mc/release/linux-amd64/mc                                   -O $BIN_DIR/mc
wget https://dl.minio.io/server/minio/release/linux-amd64/minio                             -O $BIN_DIR/minio
wget https://github.com/astaxie/bat/releases/download/v0.0.1/bat_0.0.1_linux_amd64.tar.gz   -O bat.tar.gz
wget https://github.com/stedolan/jq/releases/download/jq-1.5/jq-linux64                     -O $BIN_DIR/jq
wget https://github.com/bcicen/ctop/releases/download/v0.6.0/ctop-0.6.0-linux-amd64         -O $BIN_DIR/ctop

for f in *.zip *.bz2 *.tar.gz; do
    bsdtar xvf $f
done

mv consul nomad vault terraform packer usql consul-replicate consul-template envconsul $BIN_DIR/
mv bat_*/bat                    $BIN_DIR/
mv filebeat-*/filebeat          $BIN_DIR/
mv consul-migrate_linux_amd64   $BIN_DIR/consul-migrate

chmod +x $BIN_DIR/*
rm -rf /opt/dist

