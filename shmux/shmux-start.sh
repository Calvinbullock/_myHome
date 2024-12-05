#!/bin/bash

# exit on command failure
set -e

# Runs all the session scripts in one go
path="$HOME/_myHome/shmux/layouts/"

# p = personal
source "$path/p_general.sh"
source "$path/p_qouteCli.sh"
source "$path/p_sand.sh"
source "$path/p_wiki.sh"
#source "$path/new-life.sh"

# s = school
source "$path/s_inheritanceDes.sh"
source "$path/s_srPro.sh"
source "$path/s_webDev.sh"
