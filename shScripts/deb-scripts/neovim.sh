#!/bin/bash

#Prerequisites: https://github.com/neovim/neovim/blob/master/BUILD.md#build-prerequisites
echo "may need to update prerequisites pakages."

#Build prerequisites - NOTE may need to be update
sudo apt-get install ninja-build gettext cmake unzip curl build-essential

# Make Documents/build then cd into it (mkdir -p checks if dir already exists)
mkdir -p "$HOME/Documents/build"
cd "$HOME/Documents/build"

# clone / build
git clone https://github.com/neovim/neovim
cd neovim
git checkout stable
make CMAKE_BUILD_TYPE=RelWithDebInfo
cd build && cpack -G DEB && sudo dpkg -i nvim-linux86_64.deb
