#!/bin/bash

# A script to restore my winter semester tmux sessions  

# --------------------------- #
#           sess me
# --------------------------- #
# Change to desired directory
cd
sess=$"me"

# Create tmux session / set up panes how you like
tmux new -d -s $sess || tmux attach -t $sess
tmux split-window -h -p 25


# --------------------------- #
#           sess pac
# --------------------------- #
# Change to desired directory
cd ~/Documents/_winter-2024/cse-251/
sess=$"pac"

# Create tmux session / set up panes how you like
tmux new -d -s $sess || tmux attach -t $sess
tmux split-window -h -p 25


# --------------------------- #
#           sess dat
# --------------------------- #
# Change to desired directory
cd ~/Documents/_winter-2024/dataStruc/
sess=$"dat"

# Create tmux session / set up panes how you like
tmux new -d -s $sess || tmux attach -t $sess
tmux split-window -h -p 25


# --------------------------- #
#           sess go
# --------------------------- #
# Change to desired directory
cd ~/Documents/_winter-2024/appliedPrograming/goServer
sess=$"go"

# Create tmux session / set up panes how you like
tmux new -d -s $sess || tmux attach -t $sess
tmux split-window -h -p 25
tmux select-pane -t 1
tmux send-keys "nim main.go" Enter


# --------------------------- #
#           sess go
# --------------------------- #
# Change to desired directory
cd ~/Documents/_winter-2024/appliedPrograming/ZombieSeige/
sess=$"zom"

# Create tmux session / set up panes how you like
tmux new -d -s $sess || tmux attach -t $sess
tmux split-window -h -p 25
tmux select-pane -t 1
tmux send-keys "nim ." Enter


