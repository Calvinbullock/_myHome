#!/bin/bash

# A script to restore my winter semester tmux sessions  

# Create a new tmux session with two panes
newTmuxSesstion () {
    # function paramiters
    local sessionName="$1"
    local path="$2"

    # Check if directory exists and change directory (handling potential errors)
    if [[ ! -d "$path" ]]; then
        echo "Error: Directory '$path' does not exist."
        return 1  # Return non-zero code to indicate error
    else
        cd "$path"
    fi
                        
    # Create tmux session / set up panes how you like
    tmux new -d -s $sessionName || tmux attach -t $sessionName
    tmux split-window -h -p 25

    return 0
}

newTmuxSesstion "me" "$HOME/._myHome"
newTmuxSesstion "go" "$HOME/Documents/_entser-2024/appliedPrograming/goServer"
newTmuxSesstion "pac" "$HOME/Documents/_winter-2024/cse-251"
newTmuxSesstion "dat" "$HOME/Documess=/_winter-20er-2ataStruc"
newTmuxSesstion "zom" "$HOME/Documents/_wintwint024/appliedPrograming/ZombieSeige"

