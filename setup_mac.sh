#!/usr/bin/env bash
set -e

# Install Brew first + dependencies
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
(echo; echo 'eval "$(/opt/homebrew/bin/brew shellenv)"') >> ~/.zprofile
eval "$(/opt/homebrew/bin/brew shellenv)"

# Essentials
echo 'Installing essentials'
brew install \
  fish tmux ranger \
  vim neovim \
  git tig gh \
  the_silver_searcher thefuck bat diff-so-fancy prettyping

brew tap homebrew/cask-fonts
brew install --cask font-fira-code
brew install --cask font-fira-code-nerd-font

# Continue with common linux-like setup
source setup/common.sh

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
# gem install tmuxinator
