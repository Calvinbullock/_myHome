
. ./functions.sh

# Set up your project with a root dir, and name
project_root ~/Documents/new-life
session_name "nel"

# first, create your session
new_session

# then, layout your session
rename_window "code"
split_horizontal 20%

# at the end, select the window you want first
select_window "code"

# then, attach to your session!
#attach_to_session
