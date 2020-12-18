#!/bin/bash

# Install asdf
echo "Installing asdf..."
git clone https://github.com/asdf-vm/asdf.git ~/.asdf --branch v0.7.2

# Source
echo "Loading asdf environment..."
. $HOME/.asdf/asdf.sh

# Create .asdf-env file to load asdf environment
ENV_FILE=$HOME/.asdf-env
echo "Creating $ENV_FILE to allow loading of asdf env via function..."
cat <<EOT > $ENV_FILE
# Required for building Erlang versions
export KERL_CONFIGURE_OPTIONS="--with-ssl=$INSTALL_DIR"

# Run "asdf-env" from the terminal to load
function asdf-env() {
  echo "Loading asdf environment..."
  . $HOME/.asdf/asdf.sh
  . $HOME/.asdf/completions/asdf.bash
}
EOT

# Automatically add asdf-env for Oh My Zsh
# TIP: Add to ~/.bashrc or ~/.zshrc if not using Oh My ZSH
if [ -d "$HOME/.oh-my-zsh" ]; then
  ZSH_CUSTOM_FILE="$HOME/.oh-my-zsh/custom/asdf.zsh"
  echo "Creating $ZSH_CUSTOM_FILE to automatically load asdf environment when opening shell..."

  # Create file
  cat <<EOT > $ZSH_CUSTOM_FILE
source ~/.asdf-env
EOT
fi

# Erlang (step 1, install plugin)
echo "Installing Erlang plugin for asdf..."
asdf plugin-add erlang https://github.com/asdf-vm/asdf-erlang.git

# Erlang (step 2, install build packages)
echo "Installing Ubuntu packages required to build Erlang..."
sudo apt-get update
sudo apt-get -y install build-essential autoconf m4 libncurses5-dev libgl1-mesa-dev libglu1-mesa-dev libpng-dev libssh-dev unixodbc-dev xsltproc fop

# Erlang (step 3, install OpenSSL)
TMP_DIRECTORY=$HOME/tmp
INSTALL_DIR=$HOME/.openssl
echo "Compiling OpenSSL version required to build older Erlang versions..."
mkdir -p $TMP_DIRECTORY
cd $TMP_DIRECTORY
git clone https://github.com/openssl/openssl.git --branch OpenSSL_1_0_2-stable
cd openssl
./config --prefix=$INSTALL_DIR shared -fPIC
make depend
make -j4
make install

# Elixir
echo "Installing Elixir plugin for asdf...."
asdf plugin-add elixir https://github.com/asdf-vm/asdf-elixir.git
