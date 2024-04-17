# My bash aliases

# Custom system update alias
alias upd="sudo apt update && sudo apt upgrade && flatpak update && sudo snap refresh"

# MyHome alias
alias alia="nvim ~/_myHome/shScripts/aliases.sh"
alias alac="nvim ~/_myHome/.config/alacritty/alacritty.yml"
alias home="cd ~/_myHome"

# Shell-rc's
alias bashrc="nvim ~/_myHome/.bashrc"
alias bso="source ~/_myHome/.bashrc"
alias zrc="nvim ~/_myHome/.zshrc"
alias zso="source ~/_myHome/.zshrc"
alias swapd="cd ~/local/state/nvim/swap && ll"

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

# Grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# Git
alias gc="git commit"
alias gr="git restore"
alias gps="git push"
alias gpl="git pull"
alias gco="git checkout"
alias gd="git diff"
alias gst="git status"
alias ga="git add"
alias gap="git add -p"
alias gcm="~/_myHome/shScripts/./git-commit.sh"
#git ls-files --other 

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

# Universal directory movement
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."

# Tmux
alias tmuxrc="nvim ~/.config/tmux/tmux.conf"
alias ta="tmux a -t"
alias ts="tmux switch -t"
alias tl="tmux ls"
alias tk="tmux kill-session -t"
alias tn="tmux new -s"
alias rnw="tmux rename-window"
alias tso="tmux source-file ~/.config/tmux/tmux.conf"
alias tset="~/_myHome/shScripts/./tmux-start.sh"
#alias tms="./~/_myHome/shScripts/tmux-session-save save"
#alias tmr="./~/_myHome/shScripts/tmux-session-save restore"

# Setting wallpaper
alias pic="dolphin ~/Pictures/fav-imgs/"
alias picd="cd ~/Pictures/fav-imgs/"

# Document folder aliaes
alias doc="cd ~/Documents"
alias note="nvim ~/Documents/notes/mainNote.md"
alias noted="cd ~/Documents/notes"
alias ani="nvim ~/Documents/notes/anime.md"

#******** School winter 2024 aliases
alias winter24="cd ~/Documents/_winter-2024-school-docs/"

