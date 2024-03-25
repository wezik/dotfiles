#!/bin/bash

pacman -Sy wezterm zig neovim nvm ripgrep python starship --noconfirm

USER_HOME=$(getent passwd $SUDO_USER | cut -d: -f6)

echo 'source /usr/share/nvm/init-nvm.sh' >> "$USER_HOME/.bashrc"

nvim_repo="https://www.github.com/wezik/nvim-config"
nvim_branch="refactor/0.2"

git clone -b $nvim_branch $nvim_repo "$USER_HOME/.dotfiles/nvim"

echo "To install NodeJS and NPM restart shell and type in \"nvm install --lts\""
echo "Press Enter to continue..."
read -r
