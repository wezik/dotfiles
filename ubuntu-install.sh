#!/bin/bash

# don't run it with sudo

dot_files_repo=https://www.github.com/wezik/dotfiles.git
dot_files=~/.dotfiles
sym_links_script=~/.dotfiles/linux-symlinks.sh
temp_dir=~/.dotfiles/temp

mkdir $temp_dir

echo "__      _____ _______ _  __"
echo "\ \    / / __|_  /_ _| |/ /"
echo " \ \/\/ /| _| / / | || ' < "
echo "  \_/\_/ |___/___|___|_|\_\""

# Setup .dotfiles

chmod +x $sym_links_script
source $sym_links_script

# Install apps

# DB Viewer
# sudo snap install dbeaver-ce
sudo snap install beekeeper-studio # lovely but sadly supports only SQL :/

# Neovim and tools
sudo apt install curl
sudo snap install docker
sudo snap install ripgrep --classic
sudo snap install nvim --classic

# Language support
## Python3 should be default in the system

## Zig and packaged c++ compilers, required by Neovim
sudo snap install zig --beta --classic
## Node version manager meaning Node and NPM, required by Neovim
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
## Go lang
sudo snap install go --classic
## Rust and cargo
curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

# Shell
curl -sS https://starship.rs/install.sh | sh # starship prompt

# Font setup
font_url=https://github.com/ryanoasis/nerd-fonts/releases/download/v3.1.1/JetBrainsMono.zip
wget $font_url -P $temp_dir
fonts_dir=/.fonts
mkdir $fonts_dir
unzip $temp_dir/JetBrainsMono.zip -d $fonts_dir
fc-cache -fv

# install i3
# sudo apt install xorg lightdm lightdm-gtk-greeter i3-wm i3lock i3status i3blocks dmenu terminator

rm -rf $temp_dir
# Launch lightdm for i3 reboot
# sudo systemctl enable lightdm.service
# sudo systemctl start lightdm.service


