FROM ubuntu:16.04

USER  root
ENV   HOME             /root
ENV   DEBIAN_FRONTEND  noninteractive

RUN  apt update && apt install --yes software-properties-common apt-transport-https
RUN  add-apt-repository --yes ppa:deadsnakes/ppa
RUN  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv E0C56BD4
RUN  echo 'deb http://repo.clickhouse.tech/deb/stable/ main/' > /etc/apt/sources.list.d/clickhouse.list
RUN  apt update && apt upgrade --yes && apt install --yes \
         g++ gcc libc6-dev libffi-dev libgmp-dev make xz-utils zlib1g-dev git \
         locales \
         libzstd-dev zstd \
         gnupg netbase wget curl rsync parallel \
         python2.7-minimal \
         python3.7-dev libpython3.7-dev libmysqlclient20 python3.7-venv \
         clickhouse-client clickhouse-server

RUN     ln -sv /usr/bin/python3.7 /usr/bin/python
RUN     ln -sv /usr/bin/python3.7 /usr/bin/python3

RUN     locale-gen  'en_US.UTF-8'
ENV     LC_ALL      'en_US.UTF-8'
ENV     LANG        'en_US.UTF-8'

RUN     mkdir /var/www && chown www-data:www-data /var/www
USER    www-data
ENV     HOME /var/www
