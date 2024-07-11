#!/bin/bash

# Install all required binaries

echo "Install Homebrew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo "Homebrew installation done!"

echo "Install Volta..."
curl https://get.volta.sh | bash
echo "Volta installation done!"


echo "Install some packages..."
brew install lsd git neovim fish
echo "Packages installation done!"

echo "Configure..."

# TODO: Place dotfiles

echo "Installation done!"

