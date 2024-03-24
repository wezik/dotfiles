#!/bin/bash

echo "Creating links..."

echo "Linking NVIM"
ln -s "$HOME/.dotfiles/nvim" "$HOME/.config/nvim"
echo "Linking wezterm"
ln -s "$HOME/.dotfiles/wezterm" "$HOME/.config/wezterm"
echo "Linking .gitconfig"
ln -s "$HOME/.dotfiles/.gitconfig" "$HOME/.gitconfig"

echo "Press Enter to continue..."
read -r