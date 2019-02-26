#!/bin/sh
set -e

BASE_DIR=$PWD

# Link all config files
echo 'Link config files'
mkdir -p ~/.config
for config in $BASE_DIR/.config/*; do
    ln -fs "$config" ~/.config/$(basename "$config");
done

ln -fs $BASE_DIR/.fehbg ~/.fehbg
ln -fs $BASE_DIR/.gitconfig ~/.gitconfig
ln -fs $BASE_DIR/.gtkrc-2.0 ~/.gtkrc-2.0
ln -fs $BASE_DIR/.tigrc ~/.tigrc
ln -fs $BASE_DIR/.tmux ~/.tmux
ln -fs $BASE_DIR/.tmux.conf ~/.tmux.conf
ln -fs $BASE_DIR/.vim ~/.vim
ln -fs $BASE_DIR/.vimrc ~/.vimrc
ln -fs $BASE_DIR/.xscreensaver ~/.xscreensaver
ln -fs $BASE_DIR/.Xresources ~/.Xresources

# Essentials
echo 'Installing essentials'
sudo apt install --assume-yes \
  ssh apt-transport-https \
  terminator fish tmux ranger \
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
sudo ln -fs /etc/fonts/conf.avail/70-yes-bitmaps.conf /etc/fonts/conf.d/
set +e
sudo unlink /etc/fonts/conf.d/70-no-bitmaps.conf
set -e
sudo dpkg-reconfigure fontconfig

# Powerline font
echo 'Installing powerline font'
cd $BASE_DIR
wget -O powerline-fonts.zip https://github.com/powerline/fonts/archive/master.zip
unzip powerline-fonts.zip
./fonts-master/install.sh
rm -rf fonts-master
rm powerline-fonts.zip
