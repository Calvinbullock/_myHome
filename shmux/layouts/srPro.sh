#!/bin/bash

source $HOME/_myHome/shmux/./functions.sh

# Set up your project with a root dir, and name
project_root ~/Documents/_Fall-2024/srProject/
session_name "srPro"

# first, create your session
new_session

# then, layout your session
rename_window "code"
split_horizontal 80%

# at the end, select the window you want first
select_window "code"

# then, attach to your session!
#attach_to_session
