
# set default shell editor
export EDITOR="nvim"

# Enable colors and change prompt:
autoload -U colors && colors

setopt PROMPT_SUBST

# Git status in prompt
#   parse_git_dirty / parse_git_branch taken from
#   https://github.com/jdpedersen1/dotfiles/blob/master/.config/bash/.bashrc
function parse_git_dirty {
  STATUS="$(git status 2> /dev/null)"
  if [[ $? -ne 0 ]]; then printf ""; return; else printf " ["; fi
  if echo ${STATUS} | grep -c "renamed:"         &> /dev/null; then printf " >"; else printf ""; fi
  if echo ${STATUS} | grep -c "branch is ahead:" &> /dev/null; then printf " !"; else printf ""; fi
  if echo ${STATUS} | grep -c "new file::"       &> /dev/null; then printf " +"; else printf ""; fi
  if echo ${STATUS} | grep -c "Untracked files:" &> /dev/null; then printf " ?"; else printf ""; fi
  if echo ${STATUS} | grep -c "modified:"        &> /dev/null; then printf " *"; else printf ""; fi
  if echo ${STATUS} | grep -c "deleted:"         &> /dev/null; then printf " -"; else printf ""; fi
  printf " ]"
}

parse_git_branch() {
  # Long form
  git rev-parse --abbrev-ref HEAD 2> /dev/null
 # Short form
  # git rev-parse --abbrev-ref HEAD 2> /dev/null | sed -e 's/.*\/\(.*\)/\1/'
}

# \n was not working in the prompt so I had to make a variable
NEWLINE=$'\n'

# two line prompt
# PS1='${NEWLINE}%B%{$fg[magenta]%}%{$fg[magenta]%}%n%{$fg[grey]%} @ %{$fg[yellow]%}%M %{$fg[grey]%}in %{$fg[green]%}%~ %{$fg[grey]%}on %{$fg[blue]%}$(parse_git_branch)$(parse_git_dirty) ${NEWLINE}%(?.%{$fg[green]%}->.%{$fg[red]%}->)%{$reset_color%} '

# 3 line prompt
PS1='${NEWLINE}%B%{$fg[magenta]%}%{$fg[magenta]%}%n%{$fg[grey]%} @ %{$fg[yellow]%}%M %{$fg[grey]%}on %{$fg[blue]%}$(parse_git_branch)$(parse_git_dirty) ${NEWLINE}%{$fg[grey]%}in %{$fg[green]%}[ %~ ] ${NEWLINE}%(?.%{$fg[green]%}->.%{$fg[red]%}->)%{$reset_color%} '

# 2 line minimal prompt
#PS1='${NEWLINE}%{$fg[magenta]%}[ %~ ] %{$fg[grey]%}on %{$fg[blue]%}$(parse_git_branch)$(parse_git_dirty)${NEWLINE}%(?.%{$fg[green]%}->.%{$fg[red]%}->)%{$reset_color%} '


# history
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.histfile

# Enable searching through history
bindkey '^R' history-incremental-pattern-search-backward

# alert off
unsetopt beep

# Auto completion
setopt auto_pushd
autoload -U compinit && compinit -u
zstyle ':completion:*' menu select
# Auto complete with case insenstivity
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
# Auto compete for hidden files
zmodload zsh/complist
compinit
_comp_options+=(globdots)		# Include hidden files.

# Use vim keys in tab complete menu:
bindkey -M menuselect 'h' vi-backward-char
bindkey -M menuselect 'j' vi-down-line-or-history
bindkey -M menuselect 'k' vi-up-line-or-history
bindkey -M menuselect 'l' vi-forward-char
bindkey -M menuselect 'left' vi-backward-char
bindkey -M menuselect 'down' vi-down-line-or-history
bindkey -M menuselect 'up' vi-up-line-or-history
bindkey -M menuselect 'right' vi-forward-char

# vi mode
export KEYTIMEOUT=1
bindkey -v
bindkey "^?" backward-delete-char # fixes vi mode bug

# Change cursor shape for different vi modes.
function zle-keymap-select {
  if [[ ${KEYMAP} == vicmd ]] ||
     [[ $1 = 'block' ]]; then
    echo -ne '\e[1 q'
  elif [[ ${KEYMAP} == main ]] ||
       [[ ${KEYMAP} == viins ]] ||
       [[ ${KEYMAP} = '' ]] ||
       [[ $1 = 'beam' ]]; then
    echo -ne '\e[5 q'
  fi
}
zle -N zle-keymap-select
zle-line-init() {
    zle -K viins # initiate `vi insert` as keymap (can be removed if `bindkey -V` has been set elsewhere)
    echo -ne "\e[5 q"
}
zle -N zle-line-init
echo -ne '\e[5 q' # Use beam shape cursor on startup.
preexec() { echo -ne '\e[5 q' ;} # Use beam shape cursor for each new prompt.

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/calvin/.zshrc'

# alias file
[ -f "$HOME/._myHome/shScripts/aliases.sh" ] && source "$HOME/._myHome/shScripts/aliases.sh"


autoload -Uz compinit
compinit
# End of lines added by compinstall
