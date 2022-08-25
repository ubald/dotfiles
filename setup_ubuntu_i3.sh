#!/usr/bin/env bash
set -e

source setup/ubuntu_graphical.sh

link_configs dunst i3 i3status polybar rofi picom.conf
link_dotfiles fehbg gtkrc-2.0 xscreensaver Xresources xsession

# Manuall installations since 22.04
sudo apt install --assume-yes gnome-screenshot
# You can also install flameshot, but will need to change the desktop entry withL:
# sudo vim /usr/share/applications/org.flameshot.Flameshot.desktop 
# in order to make it default to the GUI.

# Picom (formerly known as compton)
sudo apt install --assume-yes meson ninja-build libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre3-dev libev-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev
if [ ! -d picom ]; then
    git clone https://github.com/yshui/picom.git
fi
cd picom
git checkout stable/8
git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install
cd -
rm -rf picom

# i3
echo 'Installing i3 and dependencies'
/usr/lib/apt/apt-helper download-file https://debian.sur5r.net/i3/pool/main/s/sur5r-keyring/sur5r-keyring_2021.02.02_all.deb keyring.deb SHA256:cccfb1dd7d6b1b6a137bb96ea5b5eef18a0a4a6df1d6c0c37832025d2edaa710
sudo dpkg -i ./keyring.deb
echo "deb http://debian.sur5r.net/i3/ $(grep '^DISTRIB_CODENAME=' /etc/lsb-release | cut -f2 -d=) universe" | sudo tee /etc/apt/sources.list.d/sur5r-i3.list
sudo apt update
sudo apt install --assume-yes i3 rofi feh xiccd udevil kbdd
sudo apt install --assume-yes xscreensaver xscreensaver-data xscreensaver-data-extra xscreensaver-gl xscreensaver-gl-extra xscreensaver-screensaver-bsod

# Rofi
echo 'Installing rofi'
sudo apt install --assume-yes libbison-dev flex libxkbcommon-x11-dev libstartup-notification0-dev check libglib2.0-dev libxcb-util-dev libxcb-ewmh-dev libxcb-icccm4-dev libxcb-xrm-dev libpango1.0-dev libgdk-pixbuf2.0-dev
if [ ! -d rofi ]; then
    git clone --recursive https://github.com/DaveDavenport/rofi
fi
cd rofi
git checkout 1.6.1
git submodule update --init --recursive
autoreconf -i
mkdir -p build
cd build
../configure --disable-check
make -j
sudo make install
cd ../..

# Polybar dependencies
echo 'Installing Polybar dependencies'
sudo apt install --assume-yes unifont ccache libcairo2-dev xcb-proto libasound2-dev libcurl4-openssl-dev libmpdclient-dev libiw-dev python3-sphinx python3-packaging libuv1-dev
sudo apt install --assume-yes libxcb1-dev libxcb-xkb-dev libxcb-randr0-dev libxcb-util-dev libxcb-icccm4-dev libxcb-ewmh-dev libxcb-render0-dev libxcb-composite0-dev libxcb-sync-dev libxcb-damage0-dev libxcb-composite0-dev libxcb-xrm-dev libxcb-cursor-dev python3-xcbgen libpulse-dev libjsoncpp-dev

# Build polybar
echo 'Building Polybar'
if [ -d polybar ]; then
    rm -rf polybar
fi
git clone --recurse-submodules https://github.com/jaagr/polybar.git
cd polybar
./build.sh -f --auto --all-features
cd -

# Theming Utils
echo 'Installing theming utilities'
sudo apt install --assume-yes gtk-chtheme lxappearance qt5ct
# Add this to ~/.profile: export QT_QPA_PLATFORMTHEME="qt5ct"

# Siji font
echo 'Installing siji font'
if [ -d siji ]; then
    rm -rf siji
fi
git clone --recurse-submodules https://github.com/stark/siji
cd siji
# ./install.sh -d ~/.fonts
./install.sh
cd -

# Use i3 with gnome-flashback-session
echo "Setup gnome flashback session"
cd setup/gnome
sudo make install
cd -

# Manage ssh-agent with keychain
# sudo apt install --assume-yes keychain

# Once dropbox is installed:
# dropbox exclude add Dropbox/1Password
# dropbox exclude add Dropbox/3D\ Printing
# dropbox exclude add Dropbox/Apps
# dropbox exclude add Dropbox/Backup\ Valheim
# dropbox exclude add Dropbox/My\ PC\ \(UbaldWin\)
# dropbox exclude add Dropbox/Production
# dropbox exclude add Dropbox/日本語

# Key mapper
# https://github.com/sezanzeb/key-mapper/releases
# Wayland
# https://askubuntu.com/questions/1240813/wayland-in-ubuntu-20-04-intelgpu

# https://superuser.com/questions/1151161/enable-touch-scrolling-in-firefox