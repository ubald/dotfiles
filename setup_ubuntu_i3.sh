#!/usr/bin/env bash
set -e

source setup/ubuntu_graphical.sh

link_configs dunst i3 i3status polybar picom.conf
link_dotfiles fehbg gtkrc-2.0 xscreensaver Xresources xsession

# Picom (formerly known as compton)
sudo apt install --assume-yes meson ninja libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev libpcre3-dev libevdev-dev uthash-dev libev-dev libx11-xcb-dev
git clone https://github.com/yshui/picom.git
cd picom
git checkout stable/8
git submodules update --init --recursive
meson --buildtype=release . build
ninja -C build
sudo ninja -C build install
cd -
rm -rf picom

# i3
echo 'Installing i3 and dependencies'
sudo apt install --assume-yes i3 rofi feh xiccd udevil kbdd
sudo apt install --assume-yes xscreensaver xscreensaver-data xscreensaver-data-extra xscreensaver-gl xscreensaver-gl-extra xscreensaver-screensaver-bsod

# Rofi
sudo apt install --assume-yes libbison-dev flex libxkbcommon-x11-dev libstartup-notification0-dev check
git clone --recursive https://github.com/DaveDavenport/rofi
cd rofi
git checkout 1.6.1
git submodule update --init --recursive
autoreconf -i
mkdir build
cd build
../configure --disable-check
make -j
sudo make install

# Picom
echo 'Installing picom'
sudo apt install --assume-yes libxext-dev libxcb1-dev libxcb-damage0-dev libxcb-xfixes0-dev libxcb-shape0-dev libxcb-render-util0-dev libxcb-render0-dev libxcb-randr0-dev libxcb-composite0-dev libxcb-image0-dev libxcb-present-dev libxcb-xinerama0-dev libxcb-glx0-dev libpixman-1-dev libdbus-1-dev libconfig-dev libgl1-mesa-dev  libpcre2-dev  libevdev-dev uthash-dev libev-dev libx11-xcb-dev
git clone https://github.com/yshui/picom.git
cd picom
git checkout stable/8
git submodule update --init --recursive
meson --buildtype=release . build
ninja -C build
ninja -C build install

# Polybar dependencies
echo 'Installing Polybar dependencies'
sudo apt install --assume-yes unifont ccache libcairo2-dev xcb-proto libasound2-dev libcurl4-openssl-dev libmpdclient-dev libiw-dev python3-sphinx python3-packaging
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