FROM ubuntu:16.04

USER root
ENV HOME                /root

RUN  apt update && apt upgrade --yes
RUN  apt install --yes g++ gcc libc6-dev libffi-dev libgmp-dev make xz-utils \
         zlib1g-dev libbsd-dev libncurses5-dev libtinfo-dev libzstd1-dev \
         git gnupg netbase wget curl rsync bsdtar

RUN  echo 'deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main' > /etc/apt/sources.list.d/pgdg.list
RUN  curl -s https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN  apt update && apt install libpq-dev -y
RUN  cd /tmp && wget https://github.com/commercialhaskell/stack/releases/download/v2.1.3/stack-2.1.3-linux-x86_64-static.tar.gz && tar zxf stack-*.tar.gz && cp stack-*/stack /usr/local/bin && rm -rf stack-*
RUN  curl https://gitlab.haskell.org/haskell/ghcup/raw/master/ghcup > /usr/local/bin/ghcup && chmod +x /usr/local/bin/ghcup
