#!/usr/bin/env bash
set -e

source setup/ubuntu_base.sh

# Enable Fish config
enable_fish_config ubuntu.wsl

# Make sure WSL can forward key unlocks to windows when comitting from a Windows IDE 
ln -s ~/src/dotfiles/.gnupg/gpg-agent.conf ~/.gnupg/gpg-agent.conf