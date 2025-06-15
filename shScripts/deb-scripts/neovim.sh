#!/bin/bash

#Prerequisites: https://github.com/neovim/neovim/blob/master/BUILD.md#build-prerequisites
printf "\e[1;32m** [may need to update prerequisites pakages.] **\e[0m\n"

#Build prerequisites - NOTE may need to be update
sudo apt-get install ninja-build gettext cmake unzip curl build-essential

# Make Documents/build then cd into it (mkdir -p checks if dir already exists)
mkdir -p "$HOME/Documents/build"
cd "$HOME/Documents/build"

# clone / build
printf "\e[1;32m** [Cloneing repo] **\e[0m\n"
git clone https://github.com/neovim/neovim
cd neovim
git checkout stable

# build for install into $HOME/.local/bin (local user install)
printf "\e[1;32m** [Building] **\e[0m\n"
make CMAKE_BUILD_TYPE=Release CMAKE_INSTALL_PREFIX=$HOME/.local
make install

# build as a .deb (system wide install)
#make CMAKE_BUILD_TYPE=RelWithDebInfo
#cd build && cpack -G DEB && sudo dpkg -i nvim-linux86_64.deb
