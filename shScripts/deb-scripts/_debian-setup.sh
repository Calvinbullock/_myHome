#!/bin/bash
# A script to install and set up my programs and configs, at least the ones that are available in a pkg manager or script-able.

# exit script if a command fails
# set -e # NOTE: do I actually want this??

# prompt and collect user choices
echo
printf "\e[1;32m** [install and set up flatpaks / flathub] **\e[0m\n"
read -p "Do you want to install listed items? (yes/no | y/n) " setupFlathub

printf "\e[1;32m** [install nvim from source] **\e[0m\n"
read -p "Do you want to install listed items? (yes/no | y/n) " buildNvim

# echo
# printf "\e[1;32m** [install Volta node.js manger] **\e[0m\n"
# read -p "Do you want to install listed items? (yes/no | y/n) " installVolta

echo
printf "\e[1;32m** [apt install apps: steam, vim, neofetch, npm, etc ] **\e[0m\n"
read -p "Do you want to install listed items? (yes/no | y/n) " installDebs

echo
printf "\e[1;32m** [sym link configs, tmux, nvim, alacritty, ranger, bashrc, btop, zsh. Change shell to zsh.] **\e[0m\n"
read -p "Do you want link configs? (yes/no | y/n) " linkConfigs

# update mirrors and system
printf "\e[1;32m** [updateing with apt] **\e[0m\n"
sudo apt update && sudo apt upgrade

# 3rd party codecs Kubuntu
sudo add-apt-repository multiverse
sudo apt install kubuntu-restricted-extras

# pop-Os
#sudo apt install ubuntu-restricted-extras libavcodec-extra

# ####### ################ ####### #
# ####### Package installs ####### #
# ####### ################ ####### #

# flatpak repo installs =======================
if [[ $setupFlathub =~ ^[Yy]([Ee][Ss])?$ ]]; then
    echo ""
    printf "\e[1;32m** {=====================================} **\e[0m\n"
    printf "\e[1;32m**        {Installing flathub repo}        **\e[0m\n"
    printf "\e[1;32m** {=====================================} **\e[0m\n"
    sudo apt install flatpak -y
    sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

    echo ""
    printf "\e[1;32m** {=====================================} **\e[0m\n"
    printf "\e[1;32m**       {Installing flatpak apps}         **\e[0m\n"
    printf "\e[1;32m** {=====================================} **\e[0m\n"
    flatpak install com.github.tchx84.Flatseal
    flatpak install io.gitlab.theevilskeleton.Upscaler
    flatpak install org.kde.krita
    flatpak install flathub com.brave.Browser
    flatpak install com.discordapp.Discord
fi

# nvim from source installs =====================
if [[ $buildNvim =~ ^[Yy]([Ee][Ss])?$ ]]; then
    echo ""
    printf "\e[1;32m** {=====================================} **\e[0m\n"
    printf "\e[1;32m**      {Installing / building nvim}       **\e[0m\n"
    printf "\e[1;32m** {=====================================} **\e[0m\n"
    chmod +x $HOME/_myHome/shScripts/deb-scripts/neovim.sh
    source $HOME/_myHome/shScripts/deb-scripts/neovim.sh
fi

# install volta (node.js version manager) =====================
# if [[ $installVolta =~ ^[Yy]([Ee][Ss])?$ ]]; then
#     echo ""
#     printf "\e[1;32m** {=====================================} **\e[0m\n"
#     printf "\e[1;32m**            {Installing Volta}           **\e[0m\n"
#     printf "\e[1;32m** {=====================================} **\e[0m\n"
#     curl https://get.volta.sh | bash
# fi

# apt installs ===================== basic terminal utilis / tools / apps
if [[ $installDebs =~ ^[Yy]([Ee][Ss])?$ ]]; then
    echo ""
    printf "\e[1;32m** {=====================================} **\e[0m\n"
    printf "\e[1;32m**         {installing apt pkgs...}        **\e[0m\n"
    printf "\e[1;32m** {=====================================} **\e[0m\n"

    printf "\e[1;32m** {terminal tools installing} **\e[0m\n"
    # -- terminal tools I use every day
    sudo apt install zoxide -y
    sudo apt install zsh -y
    sudo apt install tmux -y
    sudo apt install ranger -y
    sudo apt install tldr -y
    sudo apt install bat -y

    printf "\e[1;32m** {Basic apps} **\e[0m\n"
    # -- apps
    #sudo apt install kitty -y
    sudo apt install alacritty -y
    #sudo apt install steam -y
    #sudo apt install krita -y

    printf "\e[1;32m** {nvim plugin deps / teminal tools} **\e[0m\n"
    # -- nvim plugin dependencies
    sudo apt install fzf -y
    sudo apt install ripgrep -y
    #sudo apt install npm -y
    sudo apt install wl-clipboard -y
    sudo apt install golang-go -y
    sudo apt install python3-venv python3-pip -y

    printf "\e[1;32m** {other programing tools} **\e[0m\n"
    # -- other programming tools
    sudo apt install vim -y
    #sudo apt install gdb -y
    #sudo apt install cgdb -y

    printf "\e[1;32m** {other cli tools} **\e[0m\n"
    # -- other cli tools
    sudo apt install ncdu -y
    sudo apt install btop -y
    #sudo apt install lm-sensors -y
    #sudo apt install neofetch -y
    sudo apt install fastfetch -y
    #sudo apt install nvme-cli -y
    #sudo apt install htop -y
fi

# config links =====================
if [[ $linkConfigs =~ ^[Yy]([Ee][Ss])?$ ]]; then
    echo ""
    printf "\e[1;32m** {=====================================} **\e[0m\n"
    printf "\e[1;32m** {            Linking confs...         } **\e[0m\n"
    printf "\e[1;32m** {=====================================} **\e[0m\n"
    # Set up my dev repo

    rm "$HOME/.bashrc"
    ln -s "$HOME/_myHome/.bashrc" "$HOME/.bashrc"
    echo "bash conf linked"

    rm "$HOME/.zshrc"
    ln -s "$HOME/_myHome/.zshrc" "$HOME/.zshrc"
    echo "zsh conf linked"

    rm -r "$HOME/.vim"
    ln -s "$HOME/_myHome/.vim" "$HOME/.vim"
    echo "vim conf linked"

    rm "$HOME/.tmux.conf"
    ln -s "$HOME/_myHome/.config/tmux" "$HOME/.config/tmux"
    echo "tmux conf linked"

    rm -r "$HOME/.config/alacritty"
    ln -s "$HOME/_myHome/.config/alacritty" "$HOME/.config/alacritty"
    echo "alacritty conf linked"

    rm -r "$HOME/.config/kitty"
    ln -s "$HOME/_myHome/.config/kitty" "$HOME/.config/kitty"
    echo "kitty conf linked"

    rm -r "$HOME/.config/nvim"
    ln -s "$HOME/_myHome/.config/nvim" "$HOME/.config/nvim"
    echo "nvim conf linked"

    rm -r "$HOME/.config/ranger"
    ln -s "$HOME/_myHome/.config/ranger" "$HOME/.config/ranger"
    echo "ranger conf linked"

    rm -r "$HOME/.config/btop"
    ln -s "$HOME/_myHome/.config/btop" "$HOME/.config/btop"
    echo "btop conf linked"
fi

# Auto-clean up after updates and installing everything
printf "\e[1;32m** {Run autoclean} **\e[0m\n"
sudo apt purge nano -y
sudo apt autoclean

echo
printf "\e[1;32m  If you want to use zsh as defult shell, run: \e[0m\n"
printf "\e[1;32m  Sudo chsh _USER_ -s /bin/zsh.\e[0m\n"
echo
printf "\e[1;32m** Manuel install needed **\e[0m\n"
printf "\e[1;32m  MineCraft, Virtbox, Chrome, vs-Code.\e[0m\n"
echo
printf "\e[1;32m  Don't forget to set up a fire-wall!!\e[0m\n"
printf "\e[1;32m  You can now reboot! Thanks you.\e[0m\n"
echo

