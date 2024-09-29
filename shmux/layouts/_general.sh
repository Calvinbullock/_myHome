#!/bin/bash

source $HOME/_myHome/shmux/./functions.sh

# Set up your project with a root dir, and name
project_root ~/_myHome
session_name "me"

# first, create your session
new_session

# then, layout your session
rename_window "main"

echo "me - Setup"
