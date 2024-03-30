#!/bin/bash

echo "Creating links..."

echo "Linking NVIM"
ln -s "$HOME/.dotfiles/nvim" "$HOME/.config/nvim"
echo "Linking wezterm"
ln -s "$HOME/.dotfiles/wezterm" "$HOME/.config/wezterm"
echo "Linking .gitconfig"
ln -s "$HOME/.dotfiles/.config/.gitconfig" "$HOME/.gitconfig"
echo "Linking starship.toml"
ln -s "$HOME/.dotfiles/.config/starship.toml" "$HOME/.config/starship.toml"
echo "Linking .bashrc"
ln -s "$HOME/.dotfiles/.config/.bashrc" "$HOME/.bashrc"

echo "Press Enter to continue..."
read -r
