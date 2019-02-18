#!/bin/sh
set -e

BASE_DIR=$PWD

# Essentials
echo 'Installing essentials'
sudo apt install --assume-yes \
  ssh apt-transport-https \
  terminator \
  vim \
  git tig \
  build-essential clang cmake cmake-curses-gui \
  xfonts-terminus fonts-firacode fonts-inconsolata \
  silversearcher-ag fzf bat prettyping

# i3
echo 'Installing i3 and dependencies'
sudo apt install --assume-yes i3 rofi xiccd feh udevil kbdd compton compton-conf
sudo apt install --assume-yes xscreensaver xscreensaver-data xscreensaver-data-extra xscreensaver-gl xscreensaver-gl-extra xscreensaver-screensaver-bsod

# Polybar dependencies
echo 'Installing Polybar dependencies'
sudo apt install --assume-yes unifont ccache libcairo2-dev xcb-proto libasound2-dev libcurl4-openssl-dev libmpdclient-dev libiw-dev
sudo apt install --assume-yes libxcb1-dev libxcb-xkb-dev libxcb-randr0-dev libxcb-util-dev libxcb-icccm4-dev libxcb-ewmh-dev libxcb-render0-dev libxcb-composite0-dev libxcb-sync-dev libxcb-damage0-dev libxcb-composite0-dev libxcb-xrm-dev libxcb-cursor-dev python-xcbgen

# Build polybar
echo 'Building Polybar'
if [ -d polybar ]; then
    rm -rf polybar
fi
git clone --recurse-submodules https://github.com/jaagr/polybar.git
cd polybar && ./build.sh --auto --all-features
# cd polybar && mkdir build && cd build && \
# cmake                            \
#   -DCMAKE_C_COMPILER="clang"     \
#   -DCMAKE_CXX_COMPILER="clang++" \
#   -DENABLE_ALSA:BOOL="ON"        \
#   -DENABLE_I3:BOOL="ON"          \
#   -DENABLE_MPD:BOOL="ON"         \
#   -DENABLE_NETWORK:BOOL="ON"     \
#   -DENABLE_CURL:BOOL="ON"        \
#   -DBUILD_IPC_MSG:BOOL="ON"      \
#   -DWITH_XCOMPOSITE:BOOL="ON"    \
#   -DWITH_XCURSOR:BOOL="ON"       \
#   -DWITH_XDAMAGE:BOOL="ON"       \
#   -DWITH_XKB:BOOL="ON"           \
#   -DWITH_XRANDR:BOOL="ON"        \
#   -DWITH_XRANDR_MONITORS:BOOL="ON" \
#   -DWITH_XRENDER:BOOL="ON"       \
#   -DWITH_XRM:BOOL="ON"           \
#   -DWITH_XSYNC:BOOL="ON"         \
#   .. && make && sudo make install

# Linux theme
echo 'Seting up themes'
sudo apt-add-repository ppa:numix/ppa
sudo apt update
sudo apt install --assume-yes gtk-chtheme lxappearance numix-icon-theme-circle

# Toilet Fun
echo 'Seting toilet'
sudo apt install --assume-yes toilet fortunes fortunes-off fortunes-spam

# Powerline font
echo 'Installing powerline font'
cd $BASE_DIR
wget -O powerline-fonts.zip https://github.com/powerline/fonts/archive/master.zip
unzip powerline-fonts.zip
./powerline-fonts/install.sh
rm -rf powerline-fonts
rm powerline-fonts.zip

# Siji font
echo 'Installing siji font'
if [ -d siji ]; then
    rm -rf siji
fi
git clone --recurse-submodules https://github.com/stark/siji && cd siji && ./install.sh -d ~/.fonts

# Bitmap fonts
echo 'Enable bitmap fonts'
sudo ln -s /etc/fonts/conf.avail/70-yes-bitmaps.conf /etc/fonts/conf.d/
sudo unlink /etc/fonts/conf.d/70-no-bitmaps.conf
sudo dpkg-reconfigure fontconfig

cd $BASE_DIR

# Link all config files
echo 'Link config files'
mkdir ~/.config
for config in $BASE_DIR/.config/*; do
    ln -s "$config" ~/.config/$(basename "$config");
done

ln -s $BASE_DIR/.tmux ~/.tmux
ln -s $BASE_DIR/.tmux.conf ~/.tmux.conf

ln -s $BASE_DIR/.vim ~/.vim
ln -s $BASE_DIR/.vimrc ~/.vimrc

ln -s $BASE_DIR/.fehbg ~/.fehbg
ln -s $BASE_DIR/.tigrc ~/.tigrc
ln -s $BASE_DIR/.Xresources ~/.Xresources
ln -s $BASE_DIR/.xscreensaver ~/.xscreensaver

# Configure git
echo 'Configure git'
git config --global alias.ci commit
git config --global alias.co checkout
git config --global alias.st status
git config --global alias.br branch
git config --global alias.st status
git config --global alias.unstage "reset HEAD --git"
git config --global user.name "François Ubald Brien"
git config --global user.email "ubald@ubaldesign.com"

# Use fish by default
#chsh -s $(which fish)

# Manage ssh-agent with keychain
sudo apt install --assume-yes keychain
#echo "# ssh-agent at first launch of zsh
#eval \`keychain --eval --agents ssh id_rsa\`" >> ~/.zshrc

