#!/bin/bash

# Temp files
GITKRAKEN_TEMP=/tmp/gitkraken_latest.deb
ATOM_TEMP=/tmp/atom_latest.deb
VSCODE_TEMP=/tmp/vscode_latest.deb

echo ""
echo "Provision Ubuntu Dev Apps Script ---"
echo "This will install all development apps and extensions that I (xtremekforever) typically use."
echo "Please note that the apps will still need to be setup for the first time after installation."
echo ""


# GitKraken
echo ""
echo "Downloading latest GitKraken release..."
wget -q https://release.gitkraken.com/linux/gitkraken-amd64.deb -O $GITKRAKEN_TEMP

echo "Installing GitKraken..."
sudo dpkg -i $GITKRAKEN_TEMP


# Atom
echo ""
echo "Downloading latest Atom release..."
wget -q https://atom.io/download/deb -O $ATOM_TEMP

echo "Installing Atom with required dependencies..."
sudo apt install gconf2
sudo dpkg -i $ATOM_TEMP

echo "Installing Atom Extensions..."
apm install file-icons highlight-selected minimap minimap-highlight-selected


# Sublime Text
echo ""
echo "Adding Sublime Text repositories..."
sudo apt install apt-transport-https
wget -qO - https://download.sublimetext.com/sublimehq-pub.gpg | sudo apt-key add -
echo "deb https://download.sublimetext.com/ apt/stable/" | sudo tee /etc/apt/sources.list.d/sublime-text.list
sudo apt update

echo "Installing Sublime Text from repository..."
sudo apt install sublime-text

echo "Installing Sublime Text extensions..."
SUBLIME_PC_PREFS="$HOME/.config/sublime-text-3/Packages/User/Package Control.sublime-settings"
wget -NP ~/.config/sublime-text-3/Installed\ Packages/ http://sublime.wbond.net/Package%20Control.sublime-package
cat > "$SUBLIME_PC_PREFS" <<EOL
{
  "bootstrapped": true,
  "installed_packages":
  [
    "A File Icon",
    "Boxy Theme"
  ]
}
EOL


# VSCode
echo ""
echo "Downloading latest VSCode release..."
wget -q https://vscode-update.azurewebsites.net/latest/linux-deb-x64/stable -O $VSCODE_TEMP

echo "Installing VSCode..."
sudo dpkg -i $VSCODE_TEMP

echo "Installing VSCode Extensions..."
code --install-extension akamud.vscode-theme-onedark
code --install-extension maelvalais.autoconf
code --install-extension ms-vscode.cpptools
