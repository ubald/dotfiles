#!/usr/bin/env bash
set -e

link_configs() {
    configs=("$@")
    for config in "${configs[@]}"; do
        ln -fsT $PWD/.config/$config ~/.config/$config
    done
}

link_dotfiles() {
    dotfiles=("$@")
    for dotfile in "${dotfiles[@]}"; do
        ln -fsT $PWD/.$dotfile ~/.$dotfile
    done
}

enable_fish_config() {
    ln -fs ~/.config/fish/conf.d.available/$1.fish ~/.config/fish/conf.d/$1.fish
}