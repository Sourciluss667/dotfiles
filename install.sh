#!/bin/bash

# Install all required binaries

echo "Install Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo "Homebrew installation done!"

echo "Install Volta..."
curl https://get.volta.sh | bash
echo "Volta installation done!"


echo "Install some packages..."
brew install lsd git neovim fish eslint_d prettierd gitmux luarocks fd ripgrep htop lazygit docker docker-compose
echo "Packages installation done!"

echo "Install Nerd font..."
brew install --cask font-hack-nerd-font
echo "Nerd font installation done!"

echo "Install Oh My Fish..."
curl https://raw.githubusercontent.com/oh-my-fish/oh-my-fish/master/bin/install | fish
echo "OMF installation done!"

echo "Configure..."

# TODO: Place dotfiles

echo "Installation done!"

