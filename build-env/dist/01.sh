#!/bin/sh

set -x
cd /opt/dist

yum update -y
yum install epel-release -y

yum install -y which git wget unzip bsdtar httpie \
    mariadb postgresql python-devel \
    gcc gcc-g++ make perf cmake

