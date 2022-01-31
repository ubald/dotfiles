#!/usr/bin/env bash
set -e

source setup/functions.sh

# Make sure we have the submodules
git submodule update --init --recursive

mkdir -p ~/.config
link_configs bat fish nvim omf ranger alacritty
link_dotfiles gitconfig tigrc tmux tmux.conf vim vimrc

# TODO: Implement those snap configs better
#       Can't symlink, it breaks snaps with permission denied errors
mkdir -p ~/snap/ncspot/common/.config
# ln -fsT $PWD/snap/ncspot/common/.config ~/snap/ncspot/common/.config
cp $PWD/snap/ncspot/common/.config/config.toml ~/snap/ncspot/common/.config/

# Enable Fish config
enable_fish_config unix