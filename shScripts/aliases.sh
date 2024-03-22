# My bash aliases

# Custom system update alias
alias upd="sudo apt update && sudo apt upgrade && flatpak update && sudo snap refresh"

# MyHome alias
alias alia="nvim ~/._myHome/shScripts/aliases.sh"
alias alac="nvim ~/._myHome/.config/alacritty/alacritty.yml"
alias home="cd ~/._myHome"

# shellrc
alias bashrc="nvim ~/._myHome/.bashrc"
alias bso="source ~/._myHome/.bashrc"
alias zrc="nvim ~/._myHome/.zshrc"
alias zso="source ~/._myHome/.zshrc"

# shell 
alias E="exit"
alias c="clear"
alias l="clear"

# Some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls --color=auto'
#alias dir='dir --color=auto'
#alias vdir='vdir --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Git
alias gc="git commit"
alias gps="git push"
alias gpl="git pull"
alias gco="git checkout"
alias gd="git diff"
alias gst="git status"
alias ga="git add"

# NEOVIM
alias nim="nvim"
alias n="nvim"
alias nimd="cd ~/.config/nvim"
alias nimrc="nvim ~/.config/nvim/init.lua"

# Ranger
alias ran="ranger"

# Other
alias dol="dolphin"
alias py="python3"
alias temps="watch sensors"

# Vim
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
alias tn="tmux new -s"
alias tso="tmux source-file ~/.tmux.conf"
alias tset="~/._myHome/shScripts/./winter-tmux.sh"
#alias tms="./~/._myHome/shScripts/tmux-session-save save"
#alias tmr="./~/._myHome/shScripts/tmux-session-save restore"

# Seting wallaper
alias setbg="plasma-apply-wallpaperimage"
alias pic="dolphin ~/Pictures/fav-imgs/"
alias picd="cd ~/Pictures/fav-imgs/"

# Document folder aliaes
alias doc="cd ~/Documents"
alias note="nvim ~/Documents/notes/mainNote.md"
alias noted="cd ~/Documents/notes"
alias inscript="cd ~/Documents/install-scripts/"

#******** School winter 2024 alieas
alias winter24="cd ~/Documents/_winter-2024-school-docs/"
alias data="cd ~/Documents/_winter-2024/dataStruc/"
alias ap="cd ~/Documents/_winter-2024/appliedPrograming/"
alias pac="cd ~/Documents/_winter-2024/cse-251/"
alias mod="cd ~/Documents/_winter-2024/modularDesign/"
alias pvenv="source ~/Documents/_winter-2024/cse-251/.venv/bin/activate"
alias djvenv="source ~/Documents/_winter-2024/appliedPrograming/.venv/bin/activate"
alias lsnote="nvim ~/Documents/_winter-2024/lifeCycles/lifeCyclesNotes.md"

