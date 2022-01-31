#!/usr/bin/env bash
set -e

source setup/ubuntu_base.sh

link_configs blender terminator obs-studio user-dirs.dirs

# Flashboack
sudo apt install --assume-yes \
  gnome-session-flashback

# Essentials
 sudo apt install --assume-yes \
   terminator \
   xfonts-terminus fonts-firacode

# Editors
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update
sudo apt install --assume-yes sublime-text

# Linux theme
echo 'Seting up themes'
# sudo apt-add-repository ppa:numix/ppa Doesn't work anymore
sudo add-apt-repository ppa:papirus/papirus
sudo apt update
sudo apt install --assume-yes numix-gtk-theme numix-icon-theme numix-icon-theme-circle arc-theme papirus-icon-theme gnome-tweak-tool gnome-shell-extensions

# Bitmap fonts
echo 'Enable bitmap fonts'
sudo ln -fs /etc/fonts/conf.avail/70-force-bitmaps.conf /etc/fonts/conf.d/
set +e
sudo unlink /etc/fonts/conf.d/70-no-bitmaps.conf
set -e
sudo dpkg-reconfigure fontconfig-config
sudo dpkg-reconfigure fontconfig

# Terminus OTB
# Manually downloaded because not available in 20.04
wget http://mirrors.kernel.org/ubuntu/pool/universe/x/xfonts-terminus/fonts-terminus-otb_4.48-3_all.deb
sudo dpkg -i fonts-terminus-otb_4.48-3_all.deb
rm fonts-terminus-otb_4.48-3_all.deb

# Powerline font
# echo 'Installing powerline font'
# wget -O powerline-fonts.zip https://github.com/powerline/fonts/archive/master.zip
# unzip powerline-fonts.zip
# ./fonts-master/install.sh
# rm -rf fonts-master
# rm powerline-fonts.zip

# NerdFont
echo 'Installing nerd font'

mkdir -p ~/.local/share/fonts
cd ~/.local/share/fonts

curl -fLo "Terminess (TTF) Nerd Font Complete Mono.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Terminus/terminus-ttf-4.40.1/Regular/complete/Terminess%20%28TTF%29%20Nerd%20Font%20Complete%20Mono.ttf
curl -fLo "Terminess (TTF) Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Terminus/terminus-ttf-4.40.1/Regular/complete/Terminess%20%28TTF%29%20Nerd%20Font%20Complete.ttf

curl -fLo "JetBrains Mono Regular Nerd Font Complete Mono.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/Regular/complete/JetBrains%20Mono%20Regular%20Nerd%20Font%20Complete%20Mono.ttf
curl -fLo "JetBrains Mono Regular Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/Regular/complete/JetBrains%20Mono%20Regular%20Nerd%20Font%20Complete%20Mono.ttf
curl -fLo "JetBrains Mono Italic Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/Italic/complete/JetBrains%20Mono%20Italic%20Nerd%20Font%20Complete%20Mono.ttf
curl -fLo "JetBrains Mono Bold Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/Bold/complete/JetBrains%20Mono%20Bold%20Nerd%20Font%20Complete%20Mono.ttf
curl -fLo "JetBrains Mono Bold Italic Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/BoldItalic/complete/JetBrains%20Mono%20Bold%20Italic%20Nerd%20Font%20Complete%20Mono.ttf

curl -fLo "JetBrains Mono Regular Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/Regular/complete/JetBrains%20Mono%20Regular%20Nerd%20Font%20Complete.ttf
curl -fLo "JetBrains Mono Italic Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/Italic/complete/JetBrains%20Mono%20Italic%20Nerd%20Font%20Complete.ttf
curl -fLo "JetBrains Mono Bold Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/Bold/complete/JetBrains%20Mono%20Bold%20Nerd%20Font%20Complete.ttf
curl -fLo "JetBrains Mono Bold Italic Nerd Font Complete.ttf" https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/JetBrainsMono/Ligatures/BoldItalic/complete/JetBrains%20Mono%20Bold%20Italic%20Nerd%20Font%20Complete.ttf

cd -

echo 'Installing Element'
sudo wget -O /usr/share/keyrings/element-io-archive-keyring.gpg https://packages.element.io/debian/element-io-archive-keyring.gpg
echo "deb [signed-by=/usr/share/keyrings/element-io-archive-keyring.gpg] https://packages.element.io/debian/ default main" | sudo tee /etc/apt/sources.list.d/element-io.list
sudo apt update && sudo apt install --assume-yes element-desktop

echo 'Installing Signal'
wget -O- https://updates.signal.org/desktop/apt/keys.asc | gpg --dearmor > signal-desktop-keyring.gpg
cat signal-desktop-keyring.gpg | sudo tee -a /usr/share/keyrings/signal-desktop-keyring.gpg > /dev/null
echo 'deb [arch=amd64 signed-by=/usr/share/keyrings/signal-desktop-keyring.gpg] https://updates.signal.org/desktop/apt xenial main' | sudo tee -a /etc/apt/sources.list.d/signal-xenial.list
sudo apt update && sudo apt --assume-yes install signal-desktop

echo 'Installing Keybase'
curl --remote-name https://prerelease.keybase.io/keybase_amd64.deb
sudo apt update && sudo apt --assume-yes install ./keybase_amd64.deb

echo 'Installing Spotify'
curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt update && sudo apt --assume-yes install spotify-client