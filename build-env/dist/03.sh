#!/bin/sh

set -x
cd /opt/dist

## perf agent
cd /opt
wget https://github.com/jvm-profiling-tools/perf-map-agent/archive/master.tar.gz -O perf-map-agent.tar.gz
wget https://github.com/brendangregg/FlameGraph/archive/master.tar.gz            -O FlameGrap.tar.gz
wget https://github.com/jvm-profiling-tools/async-profiler/archive/master.tar.gz -O async-profiler.tar.gz

for x in *.tar.gz;
do
    bsdtar xvf $x
done

cd /opt/perf-map-agent-master
cmake .
make

cd /opt/async-profiler-master
make

