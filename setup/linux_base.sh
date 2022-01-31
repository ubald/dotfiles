#!/usr/bin/env bash
set -e

source setup/common.sh

# Enable Fish config
enable_fish_config linux

# Prettyping
wget https://raw.githubusercontent.com/denilsonsa/prettyping/master/prettyping
chmod +x prettyping
sudo mv prettyping /usr/local/bin/

# Diff So Fancy
wget https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy
chmod +x diff-so-fancy
sudo mv diff-so-fancy /usr/local/bin/

# fzf
set +e
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
set -e
~/.fzf/install --all

# Elgato Light Control
sudo apt install --assume-yes python3 python3-pip
if [ ! -d elgato ]; then
	git clone https://github.com/waxlamp/elgato.git
fi
cd elgato && sudo pip3 install .
cd ..
rm -rf ./elgato