#!/usr/bin/env bash
set -e

echo "Installing dotfiles..."

ln -sf ~/dotfiles/zsh/zshrc ~/.zshrc
ln -sf ~/dotfiles/tmux/tmux.conf ~/.tmux.conf
ln -sf ~/dotfiles/starship/starship.toml ~/.config/starship.toml
ln -sfn ~/dotfiles/nvim ~/.config/nvim

# ---- OS-specific-tweaks
case "$OSTYPE" in
  darwin*) source ~/dotfiles/bootstrap/macos.sh ;;
  linux*)  source ~/dotfiles/bootstrap/wsl.sh ;;
esac

echo "Installed dotfiles!"


