#!/bin/bash

# update mirrirs and system for apt based systems
echo "update with apt"
sudo apt update && sudo apt upgrade


# ####### Package installs ####### #

echo "install and set up flatpak / flathub"
read -p "Do you want to install listed items? (yes/no) " yn
if [[ $yn =~ ^[Yy]([Ee][Ss])?$ ]]; then
    # -- Install flatpak and add flathub -- #
    sudo apt install flatpak
    flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
    fi
fi


echo "flatpak install krita, flatseal, discord, upscaler"
read -p "Do you want to install listed items? (yes/no) " yn
if [[ $yn =~ ^[Yy]([Ee][Ss])?$ ]]; then
    sudo flatpak install com.github.tchx84.Flatseal
    # sudo flatpak install org.kde.krita
    # sudo flatpak install com.discordapp.Discord
    # sudo flatpak install io.gitlab.theevilskeleton.Upscaler
fi


echo "install nvim snap"
read -p "Do you want to install listed items? (yes/no) " yn
if [[ $yn =~ ^[Yy]([Ee][Ss])?$ ]]; then
    sudo snap install neovim
fi


echo "apt install btop, alacritty, tmux, ranger, lm-sensers"
read -p "Do you want to install listed items? (yes/no) " yn
if [[ $yn =~ ^[Yy]([Ee][Ss])?$ ]]; then
    sudo apt install btop
    # sudo apt install htop
    sudo apt install lm-sensors
    sudo apt install alacritty
    sudo apt install tmux
    sudo apt install ranger
fi


echo "link configs, tmux, nvim, alacritty, ranger, bashrc"
read -p "Do you want link configs? (yes/no) " yn
if [[ $yn =~ ^[Yy]([Ee][Ss])?$ ]]; then
    # Set up my dev repo
    rm ~/.bashrc
    Ln -s ~/._myHome/.bashrc ~/.bashrc
    ln -s ~/._myHome/.tmux.conf ~/.tmux.conf
    ln -s ~/._myHome/.config/alacritty ~/.config/alacritty
    ln -s ~/._myHome/.config/nvim ~/.config/nvim
    ln -s ~/._myHome/.config/ranger ~/.config/ranger
    # ln -s ~/_myHome/.vim ~/.vim
fi


echo "** Manuel install needed **"
echo "MineCraft, Steam, Nvim, Virtbox, Brave, Chrome, vs-Code"

