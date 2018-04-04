#!/bin/bash

echo ""
echo "Provision Ubuntu Dev Packages Script ---"
echo "This will install all the required dev packages that I (xtremekforever) use."
echo ""

echo "Installing essential build packages..."
sudo apt install -y build-essential cmake dos2unix

echo "Installing packages required for Autotools projects..."
sudo apt install -y libtool autoconf automake 
