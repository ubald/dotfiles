#!/bin/sh
set -e

BASE_DIR=$PWD

# Link all config files
echo 'Link config files'
mkdir -p ~/.config
for config in $BASE_DIR/.config/*; do
    ln -fs "$config" ~/.config/$(basename "$config");
done

#ln -fs $BASE_DIR/.fehbg ~/.fehbg
ln -fs $BASE_DIR/.gitconfig ~/.gitconfig
#ln -fs $BASE_DIR/.gtkrc-2.0 ~/.gtkrc-2.0
ln -fs $BASE_DIR/.tigrc ~/.tigrc
ln -fs $BASE_DIR/.tmux ~/.tmux
ln -fs $BASE_DIR/.tmux.conf ~/.tmux.conf
ln -fs $BASE_DIR/.vim ~/.vim
ln -fs $BASE_DIR/.vimrc ~/.vimrc
#ln -fs $BASE_DIR/.xscreensaver ~/.xscreensaver
#ln -fs $BASE_DIR/.Xresources ~/.Xresources

# Enable Fish config
ln -fs ~/.config/fish/conf.d.available/macos.fish ~/.config/fish/conf.d/macos.fish

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

# Use fish by default
chsh -s $(which fish)
# TOSO: add "omf install bass"
# TODO: omf and bobthefish doesn't work

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
