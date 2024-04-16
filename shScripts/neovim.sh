#!/bin/bash
#Source: https://github.com/drewgrif/bookworm-scripts/blob/main/neovim.sh

#Build prerequisites - NOTE may need to be update
sudo apt-get install ninja-build gettext cmake unzip curl build-essential

# Make Documents/build then cd into it (mkdir -p checks if dir already exists)
mkdir -p "$HOME/Documents/build"
cd "$HOME/Documents/build"

# clone
git clone https://github.com/neovim/neovim
cd neovim
git checkout stable
make CMAKE_BUILD_TYPE=RelWithDebInfo
cd build && cpack -G DEB && sudo dpkg -i nvim-linux64.deb
