#!/bin/sh
set -e

BASE_DIR=$PWD

# Shared dependencies for all Ubuntu installs
./setup_ubuntu_shared.sh

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

# Theming Utils
echo 'Installing theming utilities'
sudo apt install --assume-yes gtk-chtheme lxappearance

# Siji font
echo 'Installing siji font'
if [ -d siji ]; then
    rm -rf siji
fi
git clone --recurse-submodules https://github.com/stark/siji && cd siji && ./install.sh -d ~/.fonts

cd $BASE_DIR

# Manage ssh-agent with keychain
sudo apt install --assume-yes keychain
#echo "# ssh-agent at first launch of zsh
#eval \`keychain --eval --agents ssh id_rsa\`" >> ~/.zshrc