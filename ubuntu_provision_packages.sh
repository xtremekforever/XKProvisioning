#!/bin/bash

echo ""
echo "Provision Ubuntu Packages Script ---"
echo "This will install all the required packages that I (xtremekforever) use."
echo ""


# Essential packages available in the PPA
echo "Installing essential packages..."
sudo apt install -y git curl vim zsh htop nload


# Neofetch
echo ""
echo "Installing neofetch..."
sudo add-apt-repository -y ppa:dawidd0811/neofetch
sudo apt update
sudo apt install -y neofetch


# Oh-my-zsh
echo ""
echo "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
