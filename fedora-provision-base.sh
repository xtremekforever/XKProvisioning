#!/bin/bash

echo ""
echo "Provision Fedora Base Script ---"
echo "This will install packages and apps that I typically use"
echo ""

# Upgrade first
echo "Starting out by updating and upgrading all packages..."
sudo dnf update -y

# Essential packages available through DNF
echo "Installing essential packages..."
sudo dnf install -y git curl vim zsh htop nload neofetch bashtop gcc-c++ util-linux-user
sudo dnf groupinstall -y "Development Tools"

# TODO: Change default editor to vim

# Oh-my-zsh
echo ""
echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
sudo chsh -s $(which zsh)
