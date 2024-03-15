# Zsh Prompt based on your Bash Prompt
#
# Git Info
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWSTASHSTATE=true

# Prompt function
function _zsh_prompt() {
  # Get git branch info
  GIT_INFO=$(git branch &>/dev/null && echo "$(parse_git_branch %s)")
}

# Build the prompt string
NEWLINE=$'\n'
PS1="${NEWLINE}%B%{$fg[magenta]%}%{$fg[magenta]%}%n%{$fg[grey]%} @ %{$fg[yellow]%}%M %{$fg[green]%}%~ ${NEWLINE}%(?.%{$fg[green]%}->.%{$fg[red]%}-> )%{$reset_color%} "

# Call prompt function before displaying prompt
precmd_functions+=(_zsh_prompt)
