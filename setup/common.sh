#!/usr/bin/env bash
set -e

source setup/functions.sh

# Make sure we have the submodules
git submodule update --init --recursive

mkdir -p ~/.config
link_configs bat fish k9s nvim omf ranger alacritty
link_dotfiles gitconfig tigrc tmux tmux.conf vim vimrc

# Enable Fish config
enable_fish_config unix

# Install NVM
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.3/install.sh | bash