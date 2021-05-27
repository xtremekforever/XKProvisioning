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
echo ""
echo "Installing essential packages..."
sudo apt install -y git curl vim zsh htop nload neofetch build-essential

# Bashtop
echo ""
echo "Installing pip3 and bpytop..."
sudo apt install -y python3-pip
sudo -H pip3 install bpytop --upgrade

# Change default editor to vim
echo ""
echo "Changing default editor..."
sudo update-alternatives --config editor

# Give a chance to change sudo rules
echo ""
echo "Opening visudo to change sudo rules..."
sudo visudo

# Oh-my-zsh
echo ""
echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

echo "Done!"
