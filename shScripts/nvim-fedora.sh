#!/bin/bash

#Prerequisites: https://github.com/neovim/neovim/blob/master/BUILD.md#build-prerequisites
printf "\e[1;32m** [may need to update prerequisites pakages.] **\e[0m\n"

#Build prerequisites - Updated for Fedora
# Fedora uses "Development Tools" instead of "build-essential"
sudo dnf groupinstall "Development Tools" -y
sudo dnf install ninja-build gettext cmake unzip curl -y

# Make Documents/build then cd into it (mkdir -p checks if dir already exists)
mkdir -p "$HOME/Documents/build"
cd "$HOME/Documents/build"

# clone / build
printf "\e[1;32m** [Cloneing repo] **\e[0m\n"
# Fedora usually has git, but dnf will skip if already installed
sudo dnf install git -y 
git clone https://github.com/neovim/neovim
cd neovim
git checkout stable

# build for install into $HOME/.local/bin (local user install)
printf "\e[1;32m** [Building] **\e[0m\n"
make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=$HOME/.local
make install

# build as a system-wide package (Fedora uses .rpm, not .deb)
# NOTE: For Fedora, it is generally safer to stick to the 'make install' 
# to $HOME/.local above rather than manually forcing an RPM build here.
# make CMAKE_BUILD_TYPE=RelWithDebInfo
# cd build && cpack -G RPM && sudo dnf install ./nvim-linux86_64.rpm
