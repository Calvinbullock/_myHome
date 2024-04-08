#!/bin/bash
# light and portable apt based set up.
# A script to install and set up a lighter version of my programs and configs.

# update mirrors and system
echo "update with apt"
sudo apt update && sudo apt upgrade
echo

echo "apt install zsh, vim, btop, tmux, ranger"
read -p "Do you want to install listed items? (yes/no) " yn
if [[ $yn =~ ^[Yy]([Ee][Ss])?$ ]]; then
    sudo apt install vim -y
    sudo apt install btop -y
    sudo apt install zsh -y
    sudo apt install tmux -y
    sudo apt install ranger -y
fi

echo
echo "sym link configs, tmux, ranger, bashrc, btop and zsh. Change shell to zsh"
read -p "Do you want link configs? (yes/no) " yn
if [[ $yn =~ ^[Yy]([Ee][Ss])?$ ]]; then
    # Set up my dev repo
    rm "$HOME/.bashrc"
    ln -s "$HOME/._myHome/.bashrc" "$HOME/.bashrc"

    rm "$HOME/.zshrc"
    ln -s "$HOME/._myHome/.zshrc" "$HOME/.zshrc"
    
    rm "$HOME/.tmux.conf"
    ln -s "$HOME/._myHome/.config/tmux" "$HOME/.config/tmux"

    ln -s "$HOME/._myHome/.config/ranger" "$HOME/.config/ranger"

    rm -r "$HOME/.vim"
    ln -s "$HOME/._myHome/.vim" "$HOME/.vim"
    
    rm -r "$HOME/.config/btop"
    ln -s "$HOME/._myHome/.config/btop" "$HOME/.config/btop"

    sudo chsh -s /bin/zsh 
fi
echo
echo "Run next command if you want to use zsh as defult shell."
echo "sudo chsh _USER_ -s /bin/zsh "
echo
echo "Done, feel free to reboot, Have fun!"
