. ./functions.sh

# Set up your project with a root dir, and name
project_root ~/Projects/my_project
session_name "test"

# first, create your session
new_session

# then, layout your session
rename_window "code"
split_horizontal 50%
set_current_pane 2 # split on the right 
split_vertical 50%
#run_command "nvim"

new_window "servers"

# at the end, select the window you want first
select_window "code"

# then, attach to your session!
attach_to_session
