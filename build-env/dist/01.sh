#!/bin/sh

set -x
cd /opt/dist

yum update -y
yum install epel-release -y

yum install -y git wget unzip bsdtar gcc gcc-g++ make perf cmake

