#!/bin/bash

pacman -Sy wezterm zig neovim nvm ripgrep python --noconfirm

USER_HOME=$(getent passwd $SUDO_USER | cut -d: -f6)

nvim_repo="https://www.github.com/wezik/nvim-config"
nvim_branch="refactor/0.2"

git clone -b $nvim_branch $nvim_repo "$USER_HOME/.dotfiles/nvim"

echo "Press Enter to continue..."
read -r
