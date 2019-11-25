FROM ubuntu:16.04

USER root
ENV HOME                /root

RUN  apt update && apt install --yes software-properties-common && \
     add-apt-repository --yes ppa:deadsnakes/ppa && \
     apt update && apt upgrade --yes && \
     apt install --yes \
     g++ gcc libc6-dev libffi-dev libgmp-dev make xz-utils zlib1g-dev git \
     gnupg netbase wget curl rsync \
     python3.7-dev libpython3.7-dev libmysqlclient20 virtualenv

COPY requirements.txt /tmp/
RUN  virtualenv -p python3.7 /tmp/venv && \
     /tmp/venv/bin/pip install -Ur /tmp/requirements.txt
