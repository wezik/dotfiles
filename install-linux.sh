#!/bin/bash

pacman -Syu wezterm zig neovim brave-browser npm nvm --noconfirm

USER_HOME=$(getent passwrd $USER | cut -d: -f6)

git clone -b "refactor/0.2" "https://github.com/wezik/nvim-config.git" "$USER_HOME/.dotfiles/nvim"

echo "Press Enter to continue..."
read -r
