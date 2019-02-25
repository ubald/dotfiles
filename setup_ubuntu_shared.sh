#!/bin/sh
set -e

BASE_DIR=$PWD

# Link all config files
echo 'Link config files'
mkdir -p ~/.config
for config in $BASE_DIR/.config/*; do
    ln -s "$config" ~/.config/$(basename "$config");
done

ln -s $BASE_DIR/.fehbg ~/.fehbg
ln -s $BASE_DIR/.gitconfig ~/.gitconfig
ln -s $BASE_DIR/.gtkrc-2.0 ~/.gtkrc-2.0
ln -s $BASE_DIR/.tigrc ~/.tigrc
ln -s $BASE_DIR/.tmux ~/.tmux
ln -s $BASE_DIR/.tmux.conf ~/.tmux.conf
ln -s $BASE_DIR/.vim ~/.vim
ln -s $BASE_DIR/.vimrc ~/.vimrc
ln -s $BASE_DIR/.xscreensaver ~/.xscreensaver
ln -s $BASE_DIR/.Xresources ~/.Xresources

# Essentials
echo 'Installing essentials'
sudo apt install --assume-yes \
  ssh apt-transport-https \
  terminator fish tmux \
  vim \
  git tig \
  build-essential clang cmake cmake-curses-gui \
  xfonts-terminus fonts-firacode # \
  # TODO: Custom installation scripts: silversearcher-ag fzf bat prettyping

# Use fish by default
chsh -s $(which fish)

# Linux theme
echo 'Seting up themes'
sudo apt-add-repository ppa:numix/ppa
sudo apt update
sudo apt install --assume-yes numix-icon-theme-circle arc-theme

# Toilet Fun
echo 'Seting toilet'
sudo apt install --assume-yes toilet fortunes fortunes-off fortunes-spam

# Bitmap fonts
echo 'Enable bitmap fonts'
sudo ln -s /etc/fonts/conf.avail/70-yes-bitmaps.conf /etc/fonts/conf.d/
sudo unlink /etc/fonts/conf.d/70-no-bitmaps.conf
sudo dpkg-reconfigure fontconfig

# Powerline font
echo 'Installing powerline font'
cd $BASE_DIR
wget -O powerline-fonts.zip https://github.com/powerline/fonts/archive/master.zip
unzip powerline-fonts.zip
./powerline-fonts/install.sh
rm -rf powerline-fonts
rm powerline-fonts.zip
