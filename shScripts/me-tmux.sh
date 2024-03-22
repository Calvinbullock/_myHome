#!/bin/bash

# Change to desired directory
cd ~/Pictures

# Create tmux session / set up panes how you like
tmux new -d -s te || tmux attach -t te
tmux split-window -h -p 25
tmux select-pane -t 1
tmux send-keys "nim ." Enter

# Attach to that sess
tmux attach -t te
