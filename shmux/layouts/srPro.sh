#!/bin/bash

source $HOME/_myHome/shmux/./functions.sh

# Set up your project with a root dir, and name
project_root ~/Documents/_Fall-2024/srProject/noted/
session_name "srPro"

# first, create your session
new_session

# then, layout your session
rename_window "code"
set_current_pane 1
split_horizontal 80%
set_current_pane 2
set_current_pane 1
split_vertical 30%

#new_window "notes"

# at the end, select the window you want first
select_window "code"

# then, attach to your session!
#attach_to_session

echo "srPro - Setup"
