FROM ubuntu:16.04

USER    root
ENV     HOME    /root

RUN  apt update \
         && apt upgrade --yes \
         && apt install --yes software-properties-common apt-transport-https apt-utils
RUN  apt install --yes g++ gcc libc6-dev libffi-dev libgmp-dev make xz-utils \
         zlib1g-dev libbsd-dev libncurses5-dev libtinfo-dev libzstd1-dev \
         git gnupg netbase wget curl rsync bsdtar locales python2.7-minimal

RUN     locale-gen  'en_US.UTF-8'
ENV     LC_ALL      'en_US.UTF-8'
ENV     LANG        'en_US.UTF-8'

RUN  echo 'deb http://apt.postgresql.org/pub/repos/apt/ xenial-pgdg main' > /etc/apt/sources.list.d/pgdg.list
RUN  curl -s https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -
RUN  apt update && apt install libpq-dev -y

RUN  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 0xB1998361219BD9C9
RUN  echo 'deb http://repos.azulsystems.com/ubuntu stable main' | tee /etc/apt/sources.list.d/zulu.list
RUN  apt update && apt install --yes zulu-11

RUN  curl https://raw.githubusercontent.com/paulp/sbt-extras/master/sbt > /usr/bin/sbt \
         && chmod +x /usr/bin/sbt

RUN  cd /tmp \
         && wget https://github.com/commercialhaskell/stack/releases/download/v2.1.3/stack-2.1.3-linux-x86_64-static.tar.gz \
         && tar zxf stack-*.tar.gz \
         && cp stack-*/stack /usr/local/bin \
         && rm -rf stack-*

RUN  curl https://gitlab.haskell.org/haskell/ghcup/raw/master/ghcup > /usr/local/bin/ghcup \
         && chmod +x /usr/local/bin/ghcup

RUN  curl -L https://github.com/bazelbuild/bazelisk/releases/download/v1.3.0/bazelisk-linux-amd64 > /usr/local/bin/bazel \
         && chmod +x /usr/local/bin/bazel


