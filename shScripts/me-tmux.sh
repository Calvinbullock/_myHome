#!/bin/bash

# Change to desired directory
cd ~/Pictures
sess=$"dat"

# Create tmux session / set up panes how you like
tmux new -d -s $sess || tmux attach -t $sess
tmux split-window -h -p 25
tmux select-pane -t 1
tmux send-keys "nim ." Enter

# Attach to that sess
tmux attach -t te
