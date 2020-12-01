#!/bin/bash

echo "Installing OpenRazer software..."
sudo apt install -y software-properties-gtk
sudo add-apt-repository -y ppa:openrazer/stable
sudo apt install -y openrazer-meta

echo "Adding $USER to the plugdev group..."
sudo gpasswd -a $USER plugdev

echo "Installing Polychromatic software..."
sudo add-apt-repository -y ppa:polychromatic/stable
sudo apt install -y polychromatic

echo "Done!"
echo ""
