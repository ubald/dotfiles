#!/usr/bin/env bash
set -e

source setup/common.sh

# Enable Fish config
enable_fish_config linux

# Firewall
sudo ufw default allow outgoing
sudo ufw default deny incoming
sudo ufw allow ssh
sudo ufw limit ssh
sudo ufw enable

# Prettyping
wget https://raw.githubusercontent.com/denilsonsa/prettyping/master/prettyping
chmod +x prettyping
sudo mv prettyping /usr/local/bin/

# Diff So Fancy
wget https://github.com/so-fancy/diff-so-fancy/releases/download/v1.4.4/diff-so-fancy
chmod +x diff-so-fancy
sudo mv diff-so-fancy /usr/local/bin/

# fzf
set +e
git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
set -e
~/.fzf/install --all

# nvm
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.5/install.sh | bash

# pyenv
curl https://pyenv.run | bash