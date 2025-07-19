#!/bin/bash

source $HOME/_myHome/shmux/./functions.sh

# Set up your project with a root dir, and name
project_root ~/Dev/go-quote-cli/
session_name "quote"

# first, create your session
new_session

# then, layout your session
rename_window "code"
set_current_pane 1
split_horizontal 90%

# at the end, select the window you want first
select_window "code"

# then, attach to your session!
#attach_to_session

echo "quote - Setup"
