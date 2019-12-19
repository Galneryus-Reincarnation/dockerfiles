FROM ubuntu:16.04

USER root
ENV  HOME                /root

RUN  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0xB1998361219BD9C9
RUN  echo 'deb http://repos.azulsystems.com/ubuntu stable main' | tee /etc/apt/sources.list.d/zulu.list
RUN  apt update && apt upgrade --yes && apt install --yes g++ gcc libc6-dev libffi-dev libgmp-dev make xz-utils zlib1g-dev git gnupg netbase wget curl rsync zulu-11

