#!/bin/bash

ln -s "$HOME/.dotfiles/nvim" "$HOME/.config/nvim"
ln -s "$HOME/.dotfiles/wezterm" "$HOME/.config/wezterm"
ln -s "$HOME/.dotfiles/.gitconfig" "$HOME/.gitconfig"

echo "Press Enter to continue..."
read -r
