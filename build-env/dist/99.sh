#!/bin/sh

set -x

yum erase -y gcc gcc-g++ make perf cmake

rm -rf /opt/dist /opt/*.tar.gz

