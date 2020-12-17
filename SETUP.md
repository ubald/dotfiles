# Install

## Essentials

    sudo apt install terminator git xfonts-terminus

## i3

    sudo apt install i3 rofi xiccd feh udevil kbdd compton compton-conf
    sudo apt install xscreensaver xscreensaver-data xscreensaver-data-extra xscreensaver-gl xscreensaver-gl-extra xscreensaver-screensaver-bsod

### Polybar

    sudo apt install unifont ccache libcairo2-dev xcb-proto libasound2-dev libcurl4-openssl-dev libmpdclient-dev libiw-dev
    sudo apt install libxcb1-dev libxcb-xkb-dev libxcb-randr0-dev libxcb-util-dev libxcb-icccm4-dev libxcb-ewmh-dev libxcb-render0-dev libxcb-xrm-dev libxcb-composite0-dev libxcb-sync-dev libxcb-damage0-dev libxcb-cursor-dev

## Customization

    sudo apt-add-repository ppa:numix/ppa
    sudo apt update
    sudo apt install lxappearance arc-theme numix-icon-theme-*

## Fun

    sudo apt install toilet fortunes fortunes-off fortunes-spam

## Dev

    sudo apt install cmake cmake-curses-gui

# Enable Bitmap Fonts

    sudo ln -s /etc/fonts/conf.avail/70-yes-bitmaps.conf /etc/fonts/conf.d/
    sudo unlink /etc/fonts/conf.d/70-no-bitmaps.conf
    sudo dpkg-reconfigure fontconfig

# Install Headless Dropbox

https://www.dropbox.com/install-linux

# Enable defines in .Xresources (17.10)

    sudo vim /etc/gdm3/Xsession
    Line 132, remove option -nocpp for userresources

# Dual Booting

Windows uses local time and linux UTC, since it's more complicated to run windows with UTC, change linux to use local time.

    timedatectl set-local-rtc 1 --adjust-system-clock

# Misc

    fish
    tmux
    tmuxinator
    ranger
    fzf
    ag (the silver searcher)

# ArchLinux

## Good to backup

- /etc/packman.d/mirrorlist

## Setup

See `setup_arch.sh`.

# Mac

`defaults write -g com.apple.mouse.scaling 5`
