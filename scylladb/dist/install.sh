#!/bin/sh

set -x

cd /opt/dist

yum remove -y abrt
yum install -y epel-release wget
wget -O /etc/yum.repos.d/scylla.repo http://downloads.scylladb.com/rpm/centos/scylla-1.4.repo
yum install -y scylla

cd /
rm -rf /opt/dist

