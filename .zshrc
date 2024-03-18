
# Enable colors and change prompt:
autoload -U colors && colors

# Git status in prompt
#   https://github.com/git/git/blob/master/contrib/completion/git-prompt.sh
#   more instructinos here.
setopt PROMPT_SUBST
source ~/._myHome/shScripts/git-prompt.sh
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWSTASHSTATE=true

# Function to get git branch information
function _git_zsh_prompt() {
  # Capture git branch output (if successful) and format using __git_ps1
  local GIT_BRANCH=$(git branch 2>/dev/null)
  if [[ $? -eq 0 ]]; then
    # Use zsh parameter expansion for format string
    GIT_INFO='%(__git_ps1 %s)'
  fi
}

# Call the function before each prompt refresh
precmd _git_zsh_prompt

NEWLINE=$'\n'
PS1='${NEWLINE}%B%{$fg[magenta]%}%{$fg[magenta]%}%n%{$fg[grey]%} @ %{$fg[yellow]%}%M %{$fg[grey]%}in %{$fg[green]%}%~ %{$fg[blue]%}$GIT_INFO ${NEWLINE}%(?.%{$fg[green]%}->.%{$fg[red]%}->)%{$reset_color%} '

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

export EDITOR="nvim"

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/calvin/.zshrc'

# alias file
[ -f "$HOME/._myHome/shScripts/aliases.sh" ] && source "$HOME/._myHome/shScripts/aliases.sh"


autoload -Uz compinit
compinit
# End of lines added by compinstall
