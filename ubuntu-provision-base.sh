#!/bin/bash

echo ""
echo "Provision Ubuntu Base Script ---"
echo "This will install packages and apps that I typically use"
echo ""

# Upgrade first
echo "Starting out by updating and upgrading all packages..."
sudo apt update
sudo apt upgrade -y

# Essential packages available in the PPA
echo "Installing essential packages..."
sudo apt install -y git curl vim zsh htop nload neofetch build-essential

# Bashtop
echo "Add bashtop PPA and installing..."
sudo add-apt-repository -y ppa:bashtop-monitor/bashtop
sudo apt install -y bashtop

# Change default editor to vim
echo "Changing default editor..."
sudo update-alternatives --config editor

# Oh-my-zsh
echo ""
echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Done!"
