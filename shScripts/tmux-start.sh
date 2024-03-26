#!/bin/bash

# A script to open x tmux sessions you want in any directory you like.
# TODO makes panes and windows more configurable

# Create a new tmux session with two panes
newTmuxSesstion () {
    # function paramiters
    local sessionName="$1"      # name of the new tmux session
    local path="$2"             # path to the directory you want to tmux to start in

    # Check if directory  along $path exists then change to that directory
    if [[ ! -d "$path" ]]; then
        echo "Error: Directory '$path' does not exist."
        return 1  # Return non-zero code to indicate error
    else
        cd "$path"
    fi
                        
    # Create tmux session / set up 2nd pane
    tmux new -d -s $sessionName || tmux attach -t $sessionName
    tmux split-window -h -p 20

    return 0
}

# all my sessions
newTmuxSesstion "me" "$HOME/._myHome"
newTmuxSesstion "pac" "$HOME/Documents/_winter-2024/cse-251"
newTmuxSesstion "dat" "$HOME/Documests/_winter-2024/dataStruc/final-project"
newTmuxSesstion "zom" "$HOME/Documents/_winter-2024/appliedPrograming/ZombieSeige"
newTmuxSesstion "mod" "$HOME/Documents/_winter-2024/modularDesign"

