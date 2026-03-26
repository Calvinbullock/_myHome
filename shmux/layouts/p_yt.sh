#!/bin/bash

source $HOME/_myHome/shmux/./functions.sh

# Set up your project with a root dir, and name
project_root ~/Documents/
session_name "yt"

# first, create your session
new_session
rename_window "main"

# then, layout your session
select_window "main"

echo "yt - Setup"
