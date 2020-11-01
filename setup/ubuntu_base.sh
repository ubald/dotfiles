#!/usr/bin/env bash
set -e

source setup/linux_base.sh

# Enable Fish config
enable_fish_config ubuntu

# Essentials
sudo apt install --assume-yes \
  ssh apt-transport-https curl \
  fish tmux ranger \
  vim neovim \
  git tig \
  build-essential clang cmake cmake-curses-gui \
  silversearcher-ag thefuck

# Bat
wget https://github.com/sharkdp/bat/releases/download/v0.16.0/bat_0.16.0_amd64.deb
sudo dpkg -i bat_0.16.0_amd64.deb
rm bat_0.16.0_amd64.deb

# Toilet Fun
sudo apt install --assume-yes toilet fortunes fortunes-off fortunes-spam
