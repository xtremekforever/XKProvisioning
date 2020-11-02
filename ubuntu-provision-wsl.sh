#!/bin/bash

echo ""
echo "Provision Ubuntu WSL Script ---"
echo "This will configure a WSL Ubuntu distribution the way I use it"
echo ""

# Copy SSH files
echo "Copying SSH configuration from host and setting permissions..."
mkdir -p ~/.ssh
cp /mnt/c/Users/$USER/.ssh/* ~/.ssh/
chmod 600 ~/.ssh/id_rsa

# Link directories from host
echo "Linking directories from host..."
ln -sfn /mnt/c/Users/$USER/Dropbox ~/Dropbox
ln -sfn /mnt/c/Users/$USER/tmp ~/tmp

echo "Done!"
