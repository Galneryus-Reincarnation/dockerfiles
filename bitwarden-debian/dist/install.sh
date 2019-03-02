#!/bin/sh

set -x

cd /opt/dist

apt update && apt upgrade -y && apt install -y pkg-config libssl-dev git wget curl build-essential

git clone https://github.com/asdf-vm/asdf ~/.asdf
source ~/.asdf/asdf.sh

asdf plugin-list-all
asdf plugin-add rust

asdf list-all rust
asdf install rust nightly
asdf global rust nightly
asdf reshim rust nightly

git clone https://github.com/dani-garcia/bitwarden_rs
cd bitwarden_rs
git reset --hard 1.7.0

cargo run --release

echo 'DONE'

