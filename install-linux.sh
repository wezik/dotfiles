#!/bin/bash

pacman -Sy wezterm zig neovim brave-browser nodejs --noconfirm

git clone -b refactor/0.2 https://github.com/wezik/nvim-config.git "$HOME/.dotfiles/nvim"

echo "Press Enter to continue..."
read -r
