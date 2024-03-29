#!/bin/bash 

# This script will take one or two messages and send them to a git commit command.
#   An attempt to make committing slightly quicker

# Convert std in to commit message variables
file="$1"               # The file you wish to commit
commit_msg1="$2"        # Commit message
commit_msg2="$3"        # Optional 2nd more detailed message

# Function to commit with optional multiple messages
gitCommit() {
    local file="$1"
    local msg1="$2"
    local msg2="$3"
    
    if [[ -z $msg2 ]]; then
        # if msg2 is empty
        git commit "$file" -m "$msg1"
    else
        # if msg2 is not empty 
        git commit "$file" -m "$msg1" -m "$msg2"
    fi
}

# Preform commit
gitCommit "$file" "$commit_msg1" "$commit_msg2"

# -- Don't know if I want to use this or not yet...
# Push confirmation (optional)
#read -p "Push changes to remote repository? (y/n): " answer
#if [[ "$answer" =~ ^[Yy]$ ]]; then
#  git push
#fi

