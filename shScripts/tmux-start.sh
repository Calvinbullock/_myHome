#!/bin/bash

# Author: Calvin Bullock
#
# A script to open N tmux sessions you want in any directory you like.
#       Makes panes and windows in sessions more configurable

# Create a new tmux session with one pane
newTmuxSession_onePanes() {
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

    # if a preCMD is given run it in pane 1 (my panes are set to start at 1 not 0)
    if [[ ! -z "$preCMD" ]]; then
        tmux send-keys "$preCMD" Enter
    fi
    return 0
}

# Create a new tmux session with two panes
newTmuxSession_twoPanes() {
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
    tmux split-window -h -l 20%

    # if a preCMD is given run it in pane 1 (my panes are set to start at 1 not 0)
    if [[ ! -z "$preCMD" ]]; then
        tmux select-pane -t 1
        tmux send-keys "$preCMD" Enter
    fi
    return 0
}

# WARN  in beta not working yet
# Create a new tmux session with three panes
newTmuxSession_ThreePanes() {
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
    tmux split-window -h -l 20%

    # split 2nd window vertically
    tmux select-pane -t 2
    tmux split-window -v -l 50%
    return 0
}

# all my sessions
newTmuxSession_onePanes "me" "$HOME/_myHome"
newTmuxSession_twoPanes "nel" "$HOME/Documents/new-life"
#newTmuxSession_twoPanes "bat" "$HOME/Documents/battleship"
#newTmuxSession_twoPanes "go" "$HOME/Documents/flip"

newTmuxSession_twoPanes "dyn" "$HOME/Documents/_spr2024/dynamicWeb"
newTmuxSession_twoPanes "cap" "$HOME/Documents/_spr2024/encapDes"
newTmuxSession_twoPanes "bak" "$HOME/Documents/_spr2024/backEndDev"
#newTmuxSession_twoPanes "tes" "$HOME/Documents/_spr2024/softwareTesting"
#newTmuxSession_twoPanes "arc" "$HOME/Documents/_spr2024/ArcDes"

# WARN  in beta
# newTmuxSession_ThreePanes "temp" "$HOME/Documents/_spr2024/backEndDev"

