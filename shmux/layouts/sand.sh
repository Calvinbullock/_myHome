#!/bin/bash

source $HOME/_myHome/shmux/./functions.sh

# Set up your project with a root dir, and name
project_root ~/Documents/sandBox/smallPobs
session_name "sand"

# first, create your session
new_session

# then, layout your session
rename_window "code"
set_current_pane 1
split_horizontal 90%
set_current_pane 2

# at the end, select the window you want first
select_window "code"

# then, attach to your session!
#attach_to_session

echo "sand - Setup"
