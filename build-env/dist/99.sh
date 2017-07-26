#!/bin/sh

set -x

pacman -Rsn --noconfirm base-devel cmake

rm -rf /opt/dist /opt/*.tar.gz

