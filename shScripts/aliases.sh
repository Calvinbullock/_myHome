# My bash aliases

# Custom APT update alias
alias upd="sudo apt update && sudo apt upgrade && flatpak update && sudo snap refresh"
alias yoink="sudo apt install"
alias yeet="sudo apt remove"
alias yote="sudo apt purge"

# Custom DNF update alias
#alias upd="sudo dnf update --refresh && sudo dnf upgrade && flatpak update"

# ============================================================================ #
#                           BASIC BASH / ZSH CMDs
# ============================================================================ #

# _MyHome path alias
alias alia="nvim ~/_myHome/shScripts/aliases.sh"
alias alac="nvim ~/_myHome/.config/alacritty/alacritty.toml"
alias kit="nvim ~/_myHome/.config/kitty/kitty.conf"
alias home="cd ~/_myHome"

# Shell-rc's
alias bashrc="nvim ~/_myHome/.bashrc"
alias bso="source ~/_myHome/.bashrc"
alias zrc="nvim ~/_myHome/.zshrc"
alias zso="source ~/_myHome/.zshrc"
alias swapd="cd ~/.local/state/nvim/swap && ls -la" # where unwritten (n)vim buffers are saved

# shell
alias E="exit"
alias c="clear"
alias reboot="sudo reboot"
alias loginG="loginctl unlock-session"

# ls aliases
alias ls='ls --color=auto'
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
#alias ls='ls -aFh --color=always' # add colors and file type extensions
#alias dir='dir --color=auto'
#alias vdir='vdir --color=auto'

# File management / Movement
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias rmr="rm -vr"
alias cp="cp -v"
alias mv="mv -v"

# Grep
alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

# common cmds
alias bat="batcat"
alias cat-og="/usr/bin/cat"
alias cat="batcat"
alias diff="diff -y --color=always"

# ============================================================================ #
#                          less common but useful tools
# ============================================================================ #

# PYTHON
alias py="python3"
alias pyserve="python3 -m http.server" # Live server

# GIT
alias gc="git commit"
alias gps="git push"
alias gpl="git pull"
alias gco="git checkout"
alias gd="git diff"
alias gst="git status"
alias ga="git add"
alias git-upstream="git push --set-upstream origin"
#alias gcm="~/_myHome/shScripts/tools./git-commit.sh"
#git ls-files --other
#alias gap="git add -p"
#alias gr="git restore"

# git work flow
# new branch off main
alias newDev="git checkout main; git pull; git checkout -b"
alias newdev="git checkout main; git pull; git checkout -b"
alias commit="git commit -m 'to squish'; git push"

# NEOVIM / NVIM
alias nf='nvim $(fzf --preview="batcat --color=always --style=numbers --line-range=:500 {}" --preview-window right:65%)'
alias n.="nvim ."
alias n="nvim"
alias nim="nvim"
# nvim common paths -- Kind of redundant with zoxide
alias nimd="cd ~/_myHome/.config/nvim/lua"
alias nnote="nvim ~/_myHome/.config/nvim/readme.md"
alias harpd="cd ~/.local/share/nvim/harpoon && ls -la"

# VIM
alias vimd="cd ~/.vim/"
alias vimrc="vim ~/.vim/vimrc"

# TMUX
alias tmuxrc="nvim ~/.config/tmux/tmux.conf"
alias ta="tmux a -t"
alias ts="tmux switch -t"
alias tl="tmux ls"
alias tk="tmux kill-session -t"
alias tn="tmux new -s"
alias rnw="tmux rename-window"
alias tso="tmux source-file ~/.config/tmux/tmux.conf"

alias tset="~/_myHome/shScripts/tools./tmux-start.sh"
alias shmux="~/_myHome/shmux/./shmux-start.sh"

# OTHER / MISC
alias dol="dolphin" # **KDE** only
alias temps="watch sensors"
alias logd="cd /var/log"

# RANGER
alias ran="ranger"

# Document folder aliases -- Redundant with zoxide
alias doc="cd ~/Documents"
alias wiki="cd ~/Documents/wiki"
alias noted="cd ~/Documents/notes"
alias notef='find $HOME/Documents/notes/ -type f | fzf --preview="batcat --color=always --style=numbers --line-range=:500 {}" --preview-window right:65% --bind="enter:become(nvim {})"'
alias wikif='find $HOME/Documents/wiki/ -type f | fzf --preview="batcat --color=always --style=numbers --line-range=:500 {}" --preview-window right:65% --bind="enter:become(nvim {})"'

# Quick access notes / files
alias note="nvim ~/Documents/notes/_mainNote.md"
alias ani="nvim ~/Documents/notes/_anime.md"

# ============================================================================ #
#                       School winter 2024 aliases
# ============================================================================ #
alias pp="pnpm"
alias clf="clang-format -i "
alias school="cd ~/Documents/_Fall-2024/"

