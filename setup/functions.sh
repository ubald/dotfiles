#!/usr/bin/env bash
set -e

link_configs() {
    configs=("$@")
    for config in "${configs[@]}"; do
        if [ "$(uname)" == "Darwin" ]; then
            ln -fsF $PWD/.config/$config ~/.config/$config
        else
            ln -fsT $PWD/.config/$config ~/.config/$config
        fi
    done
}

link_dotfiles() {
    dotfiles=("$@")
    for dotfile in "${dotfiles[@]}"; do
        if [ "$(uname)" == "Darwin" ]; then
            ln -fsF $PWD/.$dotfile ~/.$dotfile
        else
            ln -fsT $PWD/.$dotfile ~/.$dotfile
        fi
    done
}

enable_fish_config() {
    ln -fs ~/.config/fish/conf.d.available/$1.fish ~/.config/fish/conf.d/$1.fish
}