#!/bin/bash
# A script to install and set up my programs and configs, at least the ones that are available in a pkg manager or script-able.

# prompt and collect user choices
echo
read -p "Do you want to install listed items? (yes/no) " setupFlathub
printf "\e[1;32m** [install and set up flatpak / flathub] **\e[0m\n"

echo
read -p "Do you want to install listed items? (yes/no) " installFlatpakPkgs
printf "\e[1;32m** [flatpak install krita, flatseal, upscaler, Brave] **\e[0m\n"

echo
read -p "Do you want link configs? (yes/no) " linkConfigs
printf "\e[1;32m** [sym link configs, tmux, nvim, alacritty, ranger, bashrc, btop, zsh. Change shell to zsh.] **\e[0m\n"

echo
read -p "Do you want to set up sway as you Window Manager? " setupSway
printf "\e[1;32m**  [Sway, rofi, and waybar, install and set up] **\e[0m\n"
printf "\e[1;32m**  [NOT IN WORKING ORDER] **\e[0m\n"

# update mirrors and system
printf "\e[1;32m** [update with DNF] **\e[0m\n"
sudo dnf update --refresh && sudo dnf upgrade

# ####### ################ ####### #
# ####### Package installs ####### #
# ####### ################ ####### #

# flatpak repo installs =======================
if [[ $setupFlathub =~ ^[Yy]([Ee][Ss])?$ ]]; then
    # -- Install flatpak and add flathub -- #
    sudo apt install flatpak
    sudo "flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo"
fi
 
# flatpak installs ============================
if [[ $installFlatPakPkgs =~ ^[Yy]([Ee][Ss])?$ ]]; then
    flatpak install com.github.tchx84.Flatseal
    flatpak install io.gitlab.theevilskeleton.Upscaler
    flatpak install org.kde.krita
    flatpak install flathub com.brave.Browser
    flatpak install com.discordapp.Discord
fi

# apt installs ===================== basic terminal utilis / apps
echo "apt install zsh, vim, btop, neofetch, ncdu, alacritty, tmux, ranger, steam, and lm-sensers."
#sudo dnf install fastfetch -y
#sudo dnf install vim -y
sudo dnf install btop -y
sudo dnf install zsh -y
sudo dnf install ncdu -y
# sudo dnf install htop -y
# sudo dnf install lm-sensors -y # WARN: under a different name..
sudo dnf install tmux -y
#sudo dnf install vifm -y
sudo dnf install ranger -y
sudo dnf install fzf -y
sudo dnf install tldr -y

# apps
sudo dnf install alacritty -y
#sudo dnf install steam -y

# config links =====================
if [[ $linkConfigs =~ ^[Yy]([Ee][Ss])?$ ]]; then
    # Set up my dev repo
    
    # give useful scripts execution permissions
    chmod +x "$HOME/_myHome/shScripts/tmux-start.sh"

    rm "$HOME/.bashrc"
    ln -s "$HOME/_myHome/.bashrc" "$HOME/.bashrc"

    rm "$HOME/.zshrc"
    ln -s "$HOME/_myHome/.zshrc" "$HOME/.zshrc"
    
    rm -r "$HOME/.vim"
    ln -s "$HOME/_myHome/.vim" "$HOME/.vim"
    
    rm "$HOME/.tmux.conf"
    ln -s "$HOME/_myHome/.config/tmux" "$HOME/.config/tmux"

    rm -r "$HOME/.config/alacritty"
    ln -s "$HOME/_myHome/.config/alacritty" "$HOME/.config/alacritty"
    
    rm -r "$HOME/.config/nvim"
    ln -s "$HOME/_myHome/.config/nvim" "$HOME/.config/nvim"
    
    rm -r "$HOME/.config/ranger"
    ln -s "$HOME/_myHome/.config/ranger" "$HOME/.config/ranger"

    rm -r "$HOME/.config/btop"
    ln -s "$HOME/_myHome/.config/btop" "$HOME/.config/btop"

fi

# autoclean up after updates and installing everything
sudo dnf autoclean

echo
printf "\e[1;32m** Manuel install needed **\e[0m\n"
printf "\e[1;32m  nvim, MineCraft, Virtbox, Chrome, vs-Code, Discord.\e[0m\n"
echo
printf "\e[1;32m  Run next command if you want to use zsh as defult shell.\e[0m\n"
printf "\e[1;32m  Sudo chsh _USER_ -s /bin/zsh.\e[0m\n"
echo
printf "\e[1;32m  Don't forget to set up a fire-wall!!\e[0m\n"
printf "\e[1;32m  You can now reboot! Thanks you.\e[0m\n"
echo
