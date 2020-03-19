FROM ubuntu:16.04

USER root
ENV HOME                /root

RUN  apt update && apt install --yes software-properties-common
RUN  add-apt-repository --yes ppa:deadsnakes/ppa
RUN  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv E0C56BD4
RUN  echo 'deb http://repo.clickhouse.tech/deb/stable/ main/' > /etc/apt/sources.list.d/clickhouse.list
RUN  apt update && apt upgrade --yes && apt install --yes
RUN  g++ gcc libc6-dev libffi-dev libgmp-dev make xz-utils zlib1g-dev git \
         libzstd-dev zstd \
         gnupg netbase wget curl rsync parallel \
         python3.7-dev libpython3.7-dev libmysqlclient20 virtualenv python3.7-venv \
         clickhouse-client clickhouse-server


