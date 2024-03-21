#!/usr/bin/env bash

# Script purpose: Save and restore tmux sessions and windows
# TODO: Add persist and restore the state & position of PANES
# script source:
#   https://github.com/mislav/dotfiles/blob/d2af5900fce38238d1202aa43e7332b20add6205/bin/tmux-session

# Exit immediately on errors
set -e

# Function to dump tmux session and window information
dump() {
  local d='\t'  # Define tab character as delimiter

  # List all tmux windows with session name, window name, and current pane path
  tmux list-windows -a -F "#S${d}#W${d}#{pane_current_path}"
}

# Function to save tmux session information to a file
save() {
  # Call dump function to get window list and redirect output to a file
  dump > ~/._myHome/tmux-session
}

# Function to get terminal window size (height and width)
terminal_size() {
  # Get terminal dimensions using stty size (discard standard error)
  stty size 2>/dev/null | awk '{ printf "-x%d -y%d", $2, $1 }'
}

# Function to check if a tmux session exists
session_exists() {
  # Check if session with provided name exists using tmux has-session (discard standard error)
  tmux has-session -t "$1" 2>/dev/null
}

# Function to add a window to an existing tmux session
add_window() {
  # Create a new detached window with specified name, working directory, and session
  tmux new-window -d -t "$1:" -n "$2" -c "$3"
}

# Function to create a new tmux session and window
new_session() {
  # Change directory to the specified path
  cd "$3" &&

  # Create a new detached session with specified name, window name, and optionally terminal dimensions
  tmux new-session -d -s "$1" -n "$2" $4
}

# Function to restore tmux sessions and windows
restore() {
  # Start the tmux server if not already running
  tmux start-server

  local count=0  # Counter for restored sessions
  local dimensions="$(terminal_size)"  # Capture terminal dimensions

  # Read each line from the saved tmux session file
  while IFS=$'\t' read session_name window_name dir; do
    # Check if directory exists, skip "log" and "man" windows
    if [[ -d "$dir" && $window_name != "log" && $window_name != "man" ]]; then
      # Check if the session already exists
      if session_exists "$session_name"; then
        # Add window to existing session
        add_window "$session_name" "$window_name" "$dir"
      else
        # Create a new session with the window
        new_session "$session_name" "$window_name" "$dir" "$dimensions"
        ((count++))  # Increment counter for restored sessions
      fi
    fi
  done < ~/._myHome/tmux-session

  # Print message indicating the number of restored sessions
  echo "restored $count sessions"
}

# Check the first argument passed to the script
case "$1" in
  save | restore )
    # Call the corresponding function (save or restore)
    $1
    ;;
  * )
    # Display error message for invalid commands and exit
    echo "valid commands: save, restore" >&2
    exit 1
esac
