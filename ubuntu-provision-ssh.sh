#!/bin/bash

echo ""
echo "Provision Ubuntu SSH Server Script ---"
echo "This will enable this machine as an SSH server and open firewall ports"
echo ""

# Install SSH
echo "Installing openssh-server..."
sudo apt install -y openssh-server

# Open UFW port and enable firewall
echo "Opening firewall ports and enabling firewall..."
sudo ufw allow ssh
sudo ufw enable

echo "Done!"
