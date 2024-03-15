# Zsh Prompt based on your Bash Prompt
#
# Git Info
function parse_git_branch() {
    git branch 2> /dev/null | sed -n -e 's/^\* \(.*\)/[\1]/p'
}
setopt PROMPT_SUBST

# Build the prompt string
NEWLINE=$'\n'
PS1="${NEWLINE}%B%{$fg[magenta]%}%{$fg[magenta]%}%n%{$fg[grey]%} @ %{$fg[yellow]%}%M %{$fg[grey]%}in %{$fg[green]%}%~ %{$fg[blue]%}$(parse_git_branch)${NEWLINE}%(?.%{$fg[green]%}->.%{$fg[red]%}-> )%{$reset_color%} "

# Call prompt function before displaying prompt
precmd_functions+=(_zsh_prompt)
