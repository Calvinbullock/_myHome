#!/bin/bash
# A script to install and set up my programs and configs, at least the ones that are avalable in a pkg manager.

# update mirrirs and system
echo "update with apt"
sudo apt update && sudo apt upgrade

# ####### Package installs ####### #

echo
echo "install and set up flatpak / flathub"
read -p "Do you want to install listed items? (yes/no) " yn
if [[ $yn =~ ^[Yy]([Ee][Ss])?$ ]]; then
    # -- Install flatpak and add flathub -- #
    sudo apt install flatpak
    sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
fi

echo
#echo "flatpak install krita, flatseal, discord, upscaler"
echo "flatpak install flatseal, upscaler"
read -p "Do you want to install listed items? (yes/no) " yn
if [[ $yn =~ ^[Yy]([Ee][Ss])?$ ]]; then
    sudo flatpak install com.github.tchx84.Flatseal
    sudo flatpak install io.gitlab.theevilskeleton.Upscaler
    # sudo flatpak install org.kde.krita
    # sudo flatpak install com.discordapp.Discord
fi

echo
echo "install nvim snap"
read -p "Do you want to install listed items? (yes/no) " yn
if [[ $yn =~ ^[Yy]([Ee][Ss])?$ ]]; then
    sudo snap install neovim
fi

echo
echo "apt install zsh, vim, btop, ncdu, alacritty, tmux, ranger, lm-sensers, btop"
read -p "Do you want to install listed items? (yes/no) " yn
if [[ $yn =~ ^[Yy]([Ee][Ss])?$ ]]; then
    sudo apt install vim -y
    sudo apt install btop -y
    sudo apt install zsh -y
    sudo apt install ncdu -y
    # sudo apt install htop -y
    sudo apt install lm-sensors -y
    sudo apt install alacritty -y
    sudo apt install tmux -y
    sudo apt install ranger -y
    sudo apt install btop -y
fi

echo
echo "sym link configs, tmux, nvim, alacritty, ranger, bashrc. Change sh to zsh"
read -p "Do you want link configs? (yes/no) " yn
if [[ $yn =~ ^[Yy]([Ee][Ss])?$ ]]; then
    # Set up my dev repo
    rm ~/.bashrc
    ln -s ~/._myHome/.bashrc ~/.bashrc

    rm ~/.zshrc
    ln -s ~/._myHome/.zshrc ~/.zshrc

    ln -s ~/._myHome/.tmux.conf ~/.tmux.conf
    ln -s ~/._myHome/.config/alacritty ~/.config/alacritty
    ln -s ~/._myHome/.config/nvim ~/.config/nvim
    ln -s ~/._myHome/.config/ranger ~/.config/ranger

    rm ~/.vim
    ln -s ~/._myHome/.vim ~/.vim

    sudo chsh -s /bin/zsh 
fi

echo
echo "** Manuel install needed **"
echo "MineCraft, Steam, Nvim, Virtbox, Brave, Chrome, vs-Code, Discord"

