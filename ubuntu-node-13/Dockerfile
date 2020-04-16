FROM    ubuntu:16.04

USER    root
ENV     HOME  /root

RUN     apt update && apt upgrade --yes && \
        apt install --yes build-essential wget curl rsync bsdtar xz-utils python git \
        libgl1-mesa-dev libxi-dev locales apt-transport-https

RUN     curl -s https://deb.nodesource.com/gpgkey/nodesource.gpg.key | apt-key add -
RUN     echo 'deb https://deb.nodesource.com/node_12.x xenial main' > /etc/apt/sources.list.d/nodesource.list
RUN	apt update && apt install --yes nodejs

RUN     locale-gen  'en_US.UTF-8'
ENV     LC_ALL      'en_US.UTF-8'
ENV     LANG        'en_US.UTF-8'

RUN     mkdir /var/www && chown www-data:www-data /var/www
USER    www-data
ENV     HOME /var/www
