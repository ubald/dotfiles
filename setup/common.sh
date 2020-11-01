#!/usr/bin/env bash
set -e

source setup/functions.sh

# Make sure we have the submodules
git submodule install --init --recursive

mkdir -p ~/.config
link_configs bat fish nvim omf ranger
link_dotfiles gitconfig tigrc tmux tmux.conf vim vimrc

# Enable Fish config
enable_fish_config unix

# Use fish by default
chsh -s $(which fish)

# OMF
curl -L https://get.oh-my.fish | fish
omf install