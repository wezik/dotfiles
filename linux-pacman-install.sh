#!/bin/bash

pacman -Sy wezterm zig neovim nvm ripgrep python starship --noconfirm

USER_HOME=$(getent passwd $SUDO_USER | cut -d: -f6)

echo 'source /usr/share/nvm/init-nvm.sh' >> "$USER_HOME/.bashrc"

echo "To install NodeJS and NPM restart shell and type in \"nvm install --lts\""
echo "Press Enter to continue..."
read -r
