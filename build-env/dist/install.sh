#!/bin/sh

echo '======='
echo `pwd`
echo '======='

set -x


# cd /opt/dist

pacman -Syy
pacman -S --noconfirm jdk8-openjdk python2 base-devel wget
rm -rf /var/cache/pacman/pkg/

rm -rf /opt/dist

