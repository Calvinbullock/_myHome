
# Enable colors and change prompt:
autoload -U colors && colors

# git branch in prompt
setopt PROMPT_SUBST
autoload -Uz vcs_info
precmd () { vcs_info }
zstyle ':vcs_info:git:*' formats '%b'
NEWLINE=$'\n'
PS1='${NEWLINE}%B%{$fg[magenta]%}%{$fg[magenta]%}%n%{$fg[grey]%} @ %{$fg[yellow]%}%M %{$fg[grey]%}in %{$fg[green]%}%~ %{$fg[blue]%}$vcs_info_msg_0_%f ${NEWLINE}%(?.%{$fg[green]%}->.%{$fg[red]%}->)%{$reset_color%} '

# history
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=1000

# Enable searching through history
bindkey '^R' history-incremental-pattern-search-backward

# alert off
unsetopt beep

# vi mode
export KEYTIMEOUT=1
bindkey -v

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

# vim in tab complete
#bindkey -M menuselect 'h' vi-backward-char
#bindkey -M menuselect 'j' vi-down-line-or-history
#bindkey -M menuselect 'k' vi-up-line-or-history
#bindkey -M menuselect 'l' vi-forward-char

# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/calvin/.zshrc'

# alias file
[ -f "$HOME/._myHome/shScripts/aliases.sh" ] && source "$HOME/._myHome/shScripts/aliases.sh"


autoload -Uz compinit
compinit
# End of lines added by compinstall
