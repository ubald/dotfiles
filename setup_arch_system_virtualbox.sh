#!/bin/sh
set -e

./setup_arch_system.sh

pacman --noconfirm -S xf86-video-vmware xf86-video-fbdev xf86-video-vesa