#!/bin/bash
# A script to install and set up my programs and configs, at least the ones that are available in a pkg manager.

# update mirrors and system
echo "update with apt"
sudo apt update && sudo apt upgrade

# ####### Package installs ####### #

echo
echo "install and set up flatpak / flathub"
read -p "Do you want to install listed items? (yes/no) " yn
if [[ $yn =~ ^[Yy]([Ee][Ss])?$ ]]; then
    # -- Install flatpak and add flathub -- #
    sudo apt install flatpak
    sudo "flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo"
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
echo "install nvim and brave snap"
read -p "Do you want to install listed items? (yes/no) " yn
if [[ $yn =~ ^[Yy]([Ee][Ss])?$ ]]; then
    sudo snap install neovim
    sudo snap install brave
fi

echo
echo "apt install zsh, vim, btop, ncdu, alacritty, tmux, ranger, steam, and lm-sensers."
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
    sudo apt install steam -y
fi

echo
echo "sym link configs, tmux, nvim, alacritty, ranger, bashrc, btop, zsh. Change shell to zsh."
read -p "Do you want link configs? (yes/no) " yn
if [[ $yn =~ ^[Yy]([Ee][Ss])?$ ]]; then
    # Set up my dev repo
    rm "$HOME/.bashrc"
    ln -s "$HOME/._myHome/.bashrc" "$HOME/.bashrc"

    rm "$HOME/.zshrc"
    ln -s "$HOME/._myHome/.zshrc" "$HOME/.zshrc"
    
    # give two scripts execution permissions
    chmod +x "$HOME/._myHome/shScripts/git-commit.sh"
    chmod +x "$HOME/._myHome/shScripts/tmux-start.sh"

    rm "$HOME/.tmux.conf"
    ln -s "$HOME/._myHome/.config/tmux" "$HOME/.config/tmux"

    ln -s "$HOME/._myHome/.config/alacritty" "$HOME/.config/alacritty"
    ln -s "$HOME/._myHome/.config/nvim" "$HOME/.config/nvim"
    ln -s "$HOME/._myHome/.config/ranger" "$HOME/.config/ranger"

    rm -r "$HOME/.vim"
    ln -s "$HOME/._myHome/.vim" "$HOME/.vim"
    
    rm -r "$HOME/.config/btop"
    ln -s "$HOME/._myHome/.config/btop" "$HOME/.config/btop"

    sudo chsh -s /bin/zsh 
fi

echo
echo "Sway, rofi, and waybar, install and set up."
read -p "Do you want to set up sway as you Window Manager?" yn
if [[ $yn =~ ^[Yy]([Ee][Ss])?$ ]]; then

    sudo sudo apt install sway waybar brightnessctl pulseaudio-utils wofi -y

    # set up sway config links
    rm -r "$HOME/.config/sway"
    ln -s "$HOME/._myHome/.config/sway" "$HOME/.config/sway"

    rm -r "$HOME/.config/waybar"
    ln -s "$HOME/._myHome/.config/waybar" "$HOME/.config/waybar"

    # No default config for rofi
    ln -s "$HOME/._myHome/.config/rofi" "$HOME/.config/rofi"
fi

echo
echo "** Manuel install needed **"
echo "MineCraft, Virtbox, Chrome, vs-Code, Discord"
echo "Nvim, Brave - If the snaps options was not used"
echo
echo "Done, feel free to reboot, Have fun!"
