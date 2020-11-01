#!/usr/bin/env bash
set -e

# Install Brew first + dependencies
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"

# Essentials
echo 'Installing essentials'
brew install \
  fish tmux ranger \
  vim neovim \
  git tig \
  the_silver_searcher thefuck bat diff-so-fancy prettyping \
  font-fira-code font-firacode-nerd-font

brew tap homebrew/cask-fonts
brew cask install font-fira-code font-firacode-nerd-font

# Continue with common linux-like setup
source setup/common

link_configs karabiner

# Enable Fish config
enable_fish_config macos

# Toilet Fun
echo 'Seting toilet'
brew install toilet fortune

# Fun Extras

# fzf
brew install fzf
$(brew --prefix)/opt/fzf/install

# OMF
curl -L https://get.oh-my.fish | fish

# Tmuxinator
gem install tmuxinator
