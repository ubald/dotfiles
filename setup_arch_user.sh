#!/bin/sh
set -e

BASE_DIR=$PWD

# Link all config files
echo 'Link config files'
mkdir ~/.config
for config in $BASE_DIR/.config/*; do
    ln -s "$config" ~/.config/$(basename "$config");
done

ln -s $BASE_DIR/.fehbg ~/.fehbg
ln -s $BASE_DIR/.tigrc ~/.tigrc
ln -s $BASE_DIR/.tmux ~/.tmux
ln -s $BASE_DIR/.tmux.conf ~/.tmux.conf
ln -s $BASE_DIR/.vim ~/.vim
ln -s $BASE_DIR/.vimrc ~/.vimrc
ln -s $BASE_DIR/.xinitrc ~/.xinitrc
ln -s $BASE_DIR/.Xresources ~/.Xresources
ln -s $BASE_DIR/.xscreensaver ~/.xscreensaver