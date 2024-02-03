# My bash Prompt
# 	Taken from a reddit post that forked it from stevelosh.
# 	look for PS1="...." in .bashrc and add source ~/.bash/prompt_bash.sh
# 	Source - https://www.reddit.com/r/commandline/comments/zt6x9/what_are_your_favorite_custom_prompts/
# 	Source - http://stevelosh.com/blog/2010/02/my-extravagant-zsh-prompt/

### PS1 SETTINGS =======================================================

# show more git info in PS1
export GIT_PS1_SHOWDIRTYSTATE=true
export GIT_PS1_SHOWUNTRACKEDFILES=true
export GIT_PS1_SHOWSTASHSTATE=true

# colors
export PS1_GREY="\[$(tput bold; tput setaf 0)\]"    # background text
export PS1_GREEN="\[$(tput bold; tput setaf 2)\]"   # not used
export PS1_YELLOW="\[$(tput bold; tput setaf 3)\]"  # Systeam name
export PS1_MAGENTA="\[$(tput bold; tput setaf 5)\]" # User
export PS1_CYAN="\[$(tput bold; tput setaf 6)\]"    # git branch
export PS1_WHITE="\[$(tput bold; tput setaf 7)\]"   # prompt colour
export PS1_RESET="\[$(tput sgr0)\]"                 # reset

export PS1_PINK="\[$(tput bold; tput setaf 216)\]"  # current working directory path 
export PS1_RED="\[$(tput setaf 1)\]"                # exit status

# set PS1
PS1="\n${PS1_MAGENTA}\u ${PS1_GREY}at${PS1_YELLOW} \h ${PS1_GREY}in${PS1_PINK} \w ${PS1_CYAN}\${GIT_INFO}\
        \n\${EXIT_STAT}${PS1_WHITE}\$${PS1_RESET} "

# function to set PS1
function _bash_prompt(){
    # This check has to be the first thing in the function or the $? will check the last command 
    #       in the script not the command propmt command
    # sets a command exit statues
    if [[ $? -eq 0 ]]; then
        EXIT_STAT="✔️"  # Green "✔️" for success
    else
        EXIT_STAT="❌"  # Red "❌" for failure
    fi

    # git info
    export GIT_INFO=$(git branch &>/dev/null && echo "$(__git_ps1 '%s')")
}

# call _bash_prompt() each time the prompt is refreshed
export PROMPT_COMMAND=_bash_prompt

