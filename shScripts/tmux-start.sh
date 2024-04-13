#!/bin/bash

# A script to open N tmux sessions you want in any directory you like.
# TODO makes panes and windows in sessions more configurable

# Create a new tmux session with two panes
newTmuxSesstion () {
    # function paramiters
    local sessionName="$1"      # name of the new tmux session
    local sessionDir="$2"       # path to the directory you want tmux to start in
    local preCMD="$3"           # command to run in main pane

    # Check if directory  along $path exists then change to that directory
    if [[ ! -d "$sessionDir" ]]; then
        echo "Error: Directory '$sessionDir' does not exist."
        return 1  # Return non-zero code to indicate error
    else
        cd "$sessionDir"
    fi
                        
    # Create tmux session / set up 2nd pane
    tmux new -d -s $sessionName || tmux attach -t $sessionName
    tmux split-window -h -p 20

    # if a preCMD is given run it in pane 1 (my panes are set to start at 1 not 0)
    if [[ ! -z "$preCMD" ]]; then
        tmux select-pane -t 1
        tmux send-keys "$preCMD" Enter
    fi
    return 0
}

# all my sessions
newTmuxSesstion "me" "$HOME/._myHome"
newTmuxSesstion "go" "$HOME/Documents/battleship"

