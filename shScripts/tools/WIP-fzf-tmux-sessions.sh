#!/bin/bash

# Author: Calvin Bullock
#
# A script to fuzzly find and jump between tmux sessions.
# MUST have fzf installed

# Get a list of tmux sessions names
tmux_sessions=$(tmux list-sessions | cut -d: -f1)

# Use fzf for fuzzy search
chosen_session=$(echo "$tmux_sessions" | fzf)

# Check if a session was chosen
if [[ -n "$chosen_session" ]]; then
  # Attach to the chosen session
  tmux switch -t $chosen_session
else
  echo "No session selected."
fi
