FROM ubuntu:16.04

USER root
ENV HOME                /root

RUN  echo 'APT { Install-Recommends "false"; }' > /etc/apt/apt.conf.d/norec
RUN  apt update && apt upgrade --yes
RUN  apt install --yes apt-transport-https curl wget curl rsync gnupg2 vim ca-certificates git

RUN  curl http://download.tarantool.org/tarantool/1.10/gpgkey | apt-key add -
RUN  echo 'deb http://download.tarantool.org/tarantool/1.10/ubuntu/ xenial main' | tee /etc/apt/sources.list.d/tarantool_1_10.list
RUN  cat /etc/apt/sources.list.d/tarantool_1_10.list
RUN  apt update && apt install --yes tarantool tarantool-dev build-essential cmake 

RUN  mkdir /app && cd /app && tarantoolctl rocks install http

WORKDIR /app


