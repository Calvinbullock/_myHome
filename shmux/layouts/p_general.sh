#!/bin/bash

source $HOME/_myHome/shmux/./functions.sh

# Set up your project with a root dir, and name
project_root ~/_myHome
session_name "me"

# first, create your session
new_session
rename_window "main"

#new_window "SQL"
#new_window "PWSH"
#new_window "SSH"

# then, layout your session
select_window "main"

echo "me - Setup"
