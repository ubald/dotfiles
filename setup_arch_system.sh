#!/usr/bin/env bash
set -e

# Enable Network
systemctl enable --now dhcpcd.service

# Get General Dependencies
pacman --noconfirm -S sudo git vim fish openssh
pacman --noconfirm -S xorg xorg-xinit i3-wm rxvt-unicode
pacman --noconfirm -S terminus-font

# Setup User Environment
useradd -m -s /usr/bin/fish ubald
passwd ubald
echo "ubald ALL=(ALL) ALL" > /etc/sudoers.d/01_ubald