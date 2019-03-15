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

# Enable Fish config
ln -fs ~/.config/fish/conf/conf.d.available/ubuntu.fish ~/.config/fish/conf/conf.d/ubuntu.fish

# Essentials
echo 'Installing essentials'
sudo apt install --assume-yes \
  ssh apt-transport-https \
  terminator fish tmux ranger \
  vim \
  git tig \
  build-essential clang cmake cmake-curses-gui \
  xfonts-terminus fonts-firacode \
  silversearcher-ag

# Use fish by default
chsh -s $(which fish)
# TOSO: add "omf install bass"
# TODO: omf and bobthefish doesn't work

# Linux theme
echo 'Seting up themes'
sudo apt-add-repository ppa:numix/ppa
sudo apt update
sudo apt install --assume-yes numix-icon-theme-circle arc-theme gnome-tweak-tool gnome-shell-extensions

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

# Fun Extras

# Bat
wget https://github.com/sharkdp/bat/releases/download/v0.10.0/bat_0.10.0_amd64.deb
sudo dpkg -i bat_0.10.0_amd64.deb
rm bat_0.10.0_amd64.deb

# Prettyping
wget https://raw.githubusercontent.com/denilsonsa/prettyping/master/prettyping
sudo mv prettyping /usr/local/bin/

# Diff So Fancy
wget https://raw.githubusercontent.com/so-fancy/diff-so-fancy/master/third_party/build_fatpack/diff-so-fancy
sudo mv diff-so-fancy /usr/local/bin/

# fzf
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
~/.fzf/install

# NerdFont
echo 'Installing nerd font'
mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts && curl -fLo "Terminess (TTF) Nerd Font Complete Mono.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Terminus/terminus-ttf-4.40.1/Regular/complete/Terminess%20%28TTF%29%20Nerd%20Font%20Complete%20Mono.ttf
