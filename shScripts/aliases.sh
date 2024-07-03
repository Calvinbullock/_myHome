# My bash aliases

# Custom system update alias
alias upd="sudo apt update && sudo apt upgrade && flatpak update && sudo snap refresh"
alias sapt="sudo apt"

# _MyHome alias
alias alia="nvim ~/_myHome/shScripts/aliases.sh"
alias alac="nvim ~/_myHome/.config/alacritty/alacritty.toml"
alias home="cd ~/_myHome"

# Shell-rc's
alias bashrc="nvim ~/_myHome/.bashrc"
alias bso="source ~/_myHome/.bashrc"
alias zrc="nvim ~/_myHome/.zshrc"
alias zso="source ~/_myHome/.zshrc"
alias swapd="cd ~/.local/state/nvim/swap && ls -la"

# shell 
alias E="exit"
alias c="clear"
alias l="clear"
alias reboot="sudo reboot"

# ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
alias ls='ls --color=auto'
#alias ls='ls -aFh --color=always' # add colors and file type extensions
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
alias grb="git pull --rebase"
alias gpl="git pull"
alias gco="git checkout"
alias gd="git diff"
alias gst="git status"
alias ga="git add"
alias gap="git add -p"
alias gcm="~/_myHome/shScripts/./git-commit.sh"
#git ls-files --other 

# NEOVIM || NVIM
alias nf='nvim $(fzf)'
alias n.="nvim ."
alias n="nvim"
alias nim="nvim"
alias nimd="cd ~/_myHome/.config/nvim/lua"
alias nnote="nvim ~/_myHome/.config/nvim/readme.md"

# Ranger
alias ran="ranger"

# Other
alias dol="dolphin" # **KDE** only
alias py="python3"
alias pyserve="python3 -m http.server"
alias temps="watch sensors"
alias logd="cd /var/log"

# Vim
alias vimd="cd ~/.vim/"
alias vimrc="vim ~/.vim/vimrc"

# File management / Movement
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias rm="rm -vi"
alias rmr="rm -vir"
alias cp="cp -vi"
alias mv="mv -vi"

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

# Document folder aliases
alias doc="cd ~/Documents"
alias note="nvim ~/Documents/notes/mainNote.md"
alias noted="cd ~/Documents/notes"
alias ani="nvim ~/Documents/notes/anime.md"

# =================================================
# Setting wallpaper on **KDE** -- Not quite ready
# =================================================
alias pic="dolphin ~/Pictures/fav-imgs/"
alias picd="cd ~/Pictures/fav-imgs/"

# =================================================
# NOTE  School winter 2024 aliases
# =================================================
alias pp="pnpm"
alias clf="clang-format -i "
alias winter24="cd ~/Documents/_winter-2024-school-docs/"

