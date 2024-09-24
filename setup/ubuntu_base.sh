#!/usr/bin/env bash
set -e

source setup/linux_base.sh

# Enable Fish config
enable_fish_config ubuntu

# Essentials
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt install --assume-yes \
  ssh apt-transport-https curl net-tools \
  fish tmux ranger \
  vim neovim \
  git tig \
  build-essential clang cmake cmake-curses-gui \
  binutils make autoconf automake \
  silversearcher-ag thefuck \
  pavucontrol lm-sensors

# More up to date fish
sudo apt-add-repository ppa:fish-shell/release-3
sudo apt update
sudo apt upgrade

# Use fish by default
chsh -s $(which fish)

# Bat
wget https://github.com/sharkdp/bat/releases/download/v0.16.0/bat_0.16.0_amd64.deb
sudo dpkg -i bat_0.16.0_amd64.deb
rm bat_0.16.0_amd64.deb

# OMF
curl -L https://get.oh-my.fish > install
fish install --noninteractive --yes
rm install

# Toilet Fun
sudo apt install --assume-yes toilet fortunes fortunes-spam
# fortunes-off doesn't exist anymore, people were offended *rolls eyes*

# Github Command Line
# sudo apt-key adv --keyserver keyserver.ubuntu.com --recv-key C99B11DEB97541F0
# sudo apt-add-repository https://cli.github.com/packages
# sudo apt update
# sudo apt install --assume-yes gh
(type -p wget >/dev/null || (sudo apt update && sudo apt-get install wget -y)) \
	&& sudo mkdir -p -m 755 /etc/apt/keyrings \
	&& wget -qO- https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo tee /etc/apt/keyrings/githubcli-archive-keyring.gpg > /dev/null \
	&& sudo chmod go+r /etc/apt/keyrings/githubcli-archive-keyring.gpg \
	&& echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null \
	&& sudo apt update \
	&& sudo apt install gh -y

# TODO: Implement those snap configs better
#       Can't symlink, it breaks snaps with permission denied errors
mkdir -p ~/snap/ncspot/common/.config
# ln -fsT $PWD/snap/ncspot/common/.config ~/snap/ncspot/common/.config
cp $PWD/snap/ncspot/common/.config/config.toml ~/snap/ncspot/common/.config/