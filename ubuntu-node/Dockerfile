FROM    ubuntu:16.04

USER    root
ENV     HOME  /root

RUN     apt update && apt upgrade --yes && \
        apt install --yes build-essential wget curl rsync bsdtar xz-utils python git \
        libgl1-mesa-dev libxi-dev locales

RUN     locale-gen  'en_US.UTF-8'
ENV     LC_ALL      'en_US.UTF-8'
ENV     LANG        'en_US.UTF-8'


RUN     cd /tmp && \
        wget -nv https://nodejs.org/dist/v12.14.1/node-v12.14.1-linux-x64.tar.xz && \
        bsdtar xvf node-* && \
        mv node-*/ /opt/node

RUN     rm -rf /tmp/*

ENV     PATH "/opt/node/bin:$PATH"

