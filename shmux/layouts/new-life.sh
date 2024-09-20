#!/bin/bash

source $HOME/_myHome/shmux/./functions.sh

# Set up your project with a root dir, and name
project_root ~/Documents/new-life
session_name "nel"

# first, create your session
new_session

# then, layout your session
rename_window "code"
set_current_pane 1
split_horizontal 80%
set_current_pane 2 # split on the right 

# then, attach to your session!
#attach_to_session

echo "nel - Setup"
