#!/bin/bash
# A script to install and set up my programs and configs, at least the ones that are available in a pkg manager or script-able.

# exit script if a command fails
# set -e # NOTE: do I actually want this??

# prompt and collect user choices
echo
printf "\e[1;32m** [Enable RPM Fusion & Install Codecs (Recommended for Steam/Media)] **\e[0m\n"
read -p "Do you want to enable RPM Fusion and install multimedia codecs? (yes/no | y/n) " setupRPMFusion

echo
printf "\e[1;32m** [install and set up flatpak / flathub] **\e[0m\n"
read -p "Do you want to install listed items? (yes/no | y/n) " setupFlathub

echo
printf "\e[1;32m** [flatpak install krita, flatseal, upscaler] **\e[0m\n"
read -p "Do you want to install listed items? (yes/no | y/n) " installFlatpakPkgs

echo
printf "\e[1;32m** [install nvim from source] **\e[0m\n"
read -p "Do you want to install listed items? (yes/no | y/n) " buildNvim

echo
printf "\e[1;32m** [install Volta node.js manger] **\e[0m\n"
read -p "Do you want to install listed items? (yes/no | y/n) " installVolta

echo
printf "\e[1;32m** [dnf install apps: steam, vim, neofetch, npm, etc ] **\e[0m\n"
read -p "Do you want to install listed items? (yes/no | y/n) " installDebs

echo
printf "\e[1;32m** [sym link configs, tmux, nvim, alacritty, ranger, bashrc, btop, zsh. Change shell to zsh.] **\e[0m\n"
read -p "Do you want link configs? (yes/no | y/n) " linkConfigs

echo
printf "\e[1;32m**  [Sway, rofi, and waybar, install and set up] **\e[0m\n"
printf "\e[1;32m**  [IN MOSTLY WORKING ORDER] **\e[0m\n"
read -p "Do you want to set up sway as you Window Manager (yes/no | y/n)? " setupSway

# update mirrors and system
printf "\e[1;32m** [updateing with dnf] **\e[0m\n"
sudo dnf update -y

# ####### ################ ####### #
# ####### Package installs ####### #
# ####### ################ ####### #

# RPM Fusion and Codecs =======================
if [[ $setupRPMFusion =~ ^[Yy]([Ee][Ss])?$ ]]; then
    echo ""
    printf "\e[1;32m** {=====================================} **\e[0m\n"
    printf "\e[1;32m** {  Enabling RPM Fusion & Codecs      } **\e[0m\n"
    printf "\e[1;32m** {=====================================} **\e[0m\n"
    # Install RPM Fusion Free and Nonfree
    sudo dnf install https://mirrors.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm \
    https://mirrors.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

    # Install multimedia codecs (Fedora's version of Ubuntu Restricted Extras)
    sudo dnf groupupdate core -y
    sudo dnf swap ffmpeg-free ffmpeg --allowerasing -y
    sudo dnf groupinstall "Multimedia" "Sound and Video" -y
fi

# flatpak repo installs =======================
if [[ $setupFlathub =~ ^[Yy]([Ee][Ss])?$ ]]; then
    echo ""
    printf "\e[1;32m** {=====================================} **\e[0m\n"
    printf "\e[1;32m**        {Installing flathub repo}        **\e[0m\n"
    printf "\e[1;32m** {=====================================} **\e[0m\n"
    sudo dnf install flatpak -y
    sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo
fi

# flatpak installs ============================
if [[ $installFlatpakPkgs =~ ^[Yy]([Ee][Ss])?$ ]]; then
    echo ""
    printf "\e[1;32m** {=====================================} **\e[0m\n"
    printf "\e[1;32m**       {Installing flatpak apps}         **\e[0m\n"
    printf "\e[1;32m** {=====================================} **\e[0m\n"
    flatpak install flathub com.github.tchx84.Flatseal -y
    flatpak install flathub io.gitlab.theevilskeleton.Upscaler -y
    flatpak install flathub org.kde.krita -y
    flatpak install flathub com.discordapp.Discord -y
fi

# nvim from source installs =====================
if [[ $buildNvim =~ ^[Yy]([Ee][Ss])?$ ]]; then
    echo ""
    printf "\e[1;32m** {=====================================} **\e[0m\n"
    printf "\e[1;32m**      {Installing / building nvim}       **\e[0m\n"
    printf "\e[1;32m** {=====================================} **\e[0m\n"
    chmod +x /home/calvin/_myHome/shScripts/fedora-nvim.sh
    source $HOME/_myHome/shScripts/fedora-nvim.sh
fi

# install volta (node.js version manager) =====================
if [[ $installVolta =~ ^[Yy]([Ee][Ss])?$ ]]; then
    echo ""
    printf "\e[1;32m** {=====================================} **\e[0m\n"
    printf "\e[1;32m**            {Installing Volta}           **\e[0m\n"
    printf "\e[1;32m** {=====================================} **\e[0m\n"
    curl https://get.volta.sh | bash
fi

# dnf installs ===================== basic terminal utilis / tools / apps
if [[ $installDebs =~ ^[Yy]([Ee][Ss])?$ ]]; then
    echo ""
    printf "\e[1;32m** {=====================================} **\e[0m\n"
    printf "\e[1;32m**         {installing dnf pkgs...}        **\e[0m\n"
    printf "\e[1;32m** {=====================================} **\e[0m\n"

    printf "\e[1;32m** {terminal tools installing} **\e[0m\n"
    sudo dnf install zoxide zsh tmux ranger tldr bat -y

    printf "\e[1;32m** {Basic apps} **\e[0m\n"
    sudo dnf install alacritty steam -y

    printf "\e[1;32m** {nvim plugin deps / teminal tools} **\e[0m\n"
    sudo dnf install fzf ripgrep wl-clipboard -y

    printf "\e[1;32m** {other programing tools} **\e[0m\n"
    sudo dnf install vim -y
    sudo dnf install golang -y

    printf "\e[1;32m** {other cli tools} **\e[0m\n"
    sudo dnf install ncdu btop fastfetch -y fi

# config links =====================
if [[ $linkConfigs =~ ^[Yy]([Ee][Ss])?$ ]]; then
    echo ""
    printf "\e[1;32m** {=====================================} **\e[0m\n"
    printf "\e[1;32m** {            Linking confs...         } **\e[0m\n"
    printf "\e[1;32m** {=====================================} **\e[0m\n"

    rm -f "$HOME/.bashrc"
    ln -s "$HOME/_myHome/.bashrc" "$HOME/.bashrc"
    echo "bash conf linked"

    rm -f "$HOME/.zshrc"
    ln -s "$HOME/_myHome/.zshrc" "$HOME/.zshrc"
    echo "zsh conf linked"

    rm -rf "$HOME/.vim"
    ln -s "$HOME/_myHome/.vim" "$HOME/.vim"
    echo "vim conf linked"

    rm -f "$HOME/.tmux.conf"
    ln -s "$HOME/_myHome/.config/tmux" "$HOME/.config/tmux"
    echo "tmux conf linked"

    rm -rf "$HOME/.config/alacritty"
    ln -s "$HOME/_myHome/.config/alacritty" "$HOME/.config/alacritty"
    echo "alacritty conf linked"

    rm -rf "$HOME/.config/kitty"
    ln -s "$HOME/_myHome/.config/kitty" "$HOME/.config/kitty"
    echo "kitty conf linked"

    rm -rf "$HOME/.config/nvim"
    ln -s "$HOME/_myHome/.config/nvim" "$HOME/.config/nvim"
    echo "nvim conf linked"

    rm -rf "$HOME/.config/ranger"
    ln -s "$HOME/_myHome/.config/ranger" "$HOME/.config/ranger"
    echo "ranger conf linked"

    rm -rf "$HOME/.config/btop"
    ln -s "$HOME/_myHome/.config/btop" "$HOME/.config/btop"
    echo "btop conf linked"
fi

# sway configs ==================== 
if [[ $setupSway =~ ^[Yy]([Ee][Ss])?$ ]]; then
    echo ""
    printf "\e[1;32m** {=====================================} **\e[0m\n"
    printf "\e[1;32m** {      setting up sway .configs...    } **\e[0m\n"
    printf "\e[1;32m** {=====================================} **\e[0m\n"

    sudo dnf install sway waybar brightnessctl pulseaudio-utils rofi -y

    rm -rf "$HOME/.config/sway"
    ln -s "$HOME/_myHome/.config/sway" "$HOME/.config/sway"

    rm -rf "$HOME/.config/waybar"
    ln -s "$HOME/_myHome/.config/waybar" "$HOME/.config/waybar"

    rm -rf "$HOME/.config/rofi"
    ln -s "$HOME/_myHome/.config/rofi" "$HOME/.config/rofi"
fi

# Auto-clean up
printf "\e[1;32m** {Run cleanup} **\e[0m\n"
sudo dnf remove nano -y
sudo dnf autoremove -y

echo
printf "\e[1;32m  If you want to use zsh as defult shell, run: \e[0m\n"
printf "\e[1;32m  sudo chsh $USER -s /bin/zsh \e[0m\n"
printf "\e[1;32m  REBOOT for this to take effect \e[0m\n"
echo
printf "\e[1;32m** Manuel install needed **\e[0m\n"
printf "\e[1;32m  Brave MineCraft, Virtbox, Chrome, vs-Code, Discord.\e[0m\n"
echo
printf "\e[1;32m  Don't forget to set up a fire-wall!!\e[0m\n"
printf "\e[1;32m  You can now reboot! Thanks you.\e[0m\n"
echo
