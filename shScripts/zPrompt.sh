# Zsh Prompt based on your Bash Prompt

# Colors (assuming your terminal supports these)
export PS1_USER="\[\e[1;35m\]"  # Magenta
export PS1_SYSTEM="\[\e[1;33m\]" # Yellow
export PS1_BG_TEXT="\[\e[1;30m\]"  # Background text - Grey
export PS1_PWD="\[\e[0;38;5;42m\]" # Miku Green
export PS1_GIT="\[\e[0;34m\]"     # Blue
export PS1_WHITE="\[\e[1;37m\]"  # White
export PS1_RESET="\[\e[0m\]"     # Reset to default

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
PS1="\n${PS1_USER}\u${PS1_BG_TEXT}@${PS1_SYSTEM}\h ${PS1_BG_TEXT}in ${PS1_PWD}\w ${PS1_GIT}${GIT_INFO}\n${PS1_WHITE}\$(if [[ $? = 0 ]]; then echo '->'; else echo '->!'; fi)${PS1_RESET}"

# Call prompt function before displaying prompt
precmd_functions+=(_zsh_prompt)
