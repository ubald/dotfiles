#!/bin/sh
set -e

source setup_arch_system.sh

pacman --noconfirm -S xf86-video-vmware xf86-video-fbdev xf86-video-vesa