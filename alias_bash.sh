# All my bash aliases

# Custom system update alias
alias upd="sudo apt update && sudo apt upgrade && flatpak update && sudo snap refresh"

# Tempature sensors
alias temps="watch sensors"

# MyHome alias
alias basha="nvim ~/._myHome/alias_bash.sh"
alias alac="nvim ~/._myHome/.config/alacritty/alacritty.yml"
alias home="cd ~/._myHome"

# BASHRC and shell 
alias bashrc="nvim ~/.bashrc"
alias bso="source ~/.bashrc"
alias E="exit"
alias c="clear"
alias l="clear"

# git
alias gc="git commit"
alias gps="git push"
alias gpl="git push"
alias gd="git diff"
alias gitstat="git status"

# NEOVIM
alias nim="nvim"
alias n="nvim"
alias nimd="cd ~/.config/nvim"
alias nimrc="nvim ~/.config/nvim/init.lua"

# vim
alias vimd="cd ~/.vim/"
alias vimrc="vim ~/.vim/vimrc"

# Universial directory movement
alias ..="cd .."
alias ...="cd ../.."

# Tmux
alias tmuxrc="nvim ~/.tmux.conf"
alias ta="tmux a -t"
alias ts="tmux switch -t"
alias tl="tmux ls"
alias tk="tmux kill-session -t"
alias tm="tmux new -s"
alias tso="tmux source-file ~/.tmux.conf"

# Document folder aliaes
alias doc="cd ~/Documents"
alias note="nvim ~/Documents/notes/mainNote.md"
alias noted="cd ~/Documents/notes"
alias inscript="cd ~/Documents/install-scripts/"

alias py="python3"

#******** School winter 2024 alieas
alias winter24="cd ~/Documents/_winter-2024-school-docs/"
alias data="cd ~/Documents/_winter-2024-school-docs/dataStruc/"
alias ap="cd ~/Documents/_winter-2024-school-docs/appliedPrograming/"
alias pac="cd ~/Documents/_winter-2024-school-docs/cse-251-student-version/"
alias mod="cd ~/Documents/_winter-2024-school-docs/modularDesign/"
alias pvenv="source ~/Documents/_winter-2024-school-docs/cse-251-student-version/.venv/bin/activate"
alias djvenv="source ~/Documents/_winter-2024-school-docs/appliedPrograming/.venv/bin/activate"
alias lsnote="nvim ~/Documents/_winter-2024-school-docs/lifeCycles/lifeCyclesNotes.txt"

