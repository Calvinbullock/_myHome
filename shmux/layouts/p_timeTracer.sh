#!/bin/bash

source $HOME/_myHome/shmux/./functions.sh

# Set up your project with a root dir, and name
project_root ~/Dev/timetracer/
session_name "timeTracer"

# first, create your session
new_session

# then, layout your session
rename_window "code"
set_current_pane 1
split_horizontal 90%
set_current_pane 2 # split on the right

# then, attach to your session!
#attach_to_session

echo "timeTracer - Setup"
