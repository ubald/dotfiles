#!/usr/bin/env bash
set -e

source setup/functions.sh

# Make sure we have the submodules
git submodule update --init --recursive

mkdir -p ~/.config
link_configs bat fish nvim omf ranger alacritty
link_dotfiles gitconfig tigrc tmux tmux.conf vim vimrc

# Enable Fish config
enable_fish_config unix