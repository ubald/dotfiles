#!/usr/bin/env bash
set -e

# From Installation Guide:

# Set keyboard layout (default is US)
# ls /usr/share/kbd/keymaps/**/*.map.gz
# loadkeys us

# Check that this doesn't give any erros
# ls /sys/firmware/efi/efivars

# Connect to the internet
# ip link
# ping archlinux.org

# Update system clock
# timedatectl set-ntp true
# timedatectl status

# Partition the disk
# fdisk -l

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