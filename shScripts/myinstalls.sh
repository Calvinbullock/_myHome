#!/bin/bash

# update mirrirs and system for apt based systems
sudo apt update && sudo apt upgrade

# ####### Package installs ####### #

# -- Install flatpak and add flathub -- #
# echo "install flatpak / flathub"
# sudo apt install flatpak
# flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

echo "flatpak install krita, flatseal, discord, upscaler"
sudo flatpak install com.github.tchx84.Flatseal
# sudo flatpak install org.kde.krita
# sudo flatpak install com.discordapp.Discord
# sudo flatpak install io.gitlab.theevilskeleton.Upscaler

# echo "install nvim"
# sudo snap install neovim

echo "apt install btop, alacritty, tmux"
sudo apt install btop
# sudo apt install htop
# sudo apt install lm-sensors
sudo apt install alacritty
sudo apt install tmux

# Clone and set up my dev repo
echo "clone and set up my dev repo"
cd ~
git clone https://github.com/Calvinbullock/_myHome.git
cd ~
rm ~/.bashrc
Ln -s ~/_myHome/.bashrc ~/.bashrc
ln -s ~/_myHome/.tmux.conf ~/.tmux.conf
ln -sn ~/_myHome/.config/alacritty ~/.config/alacritty
ln -sn ~/_myHome/.config/nvim ~/.config/nvim
# ln -sn ~/_myHome/.vim ~/.vim

echo "** Manuel instal needed **"
echo "MineCraft, Steam, Nvim, Virtbox, Brave, Chrome, vs-Code"

