#!/bin/bash

# This script will start your Minecraft server persistently in the background
# and then temporarily inhibit GNOME from sleeping or idling for a specified duration.

# consts
INHIBIT_DURATION_HOURS=6
INHIBIT_DURATION_SECONDS=$((INHIBIT_DURATION_HOURS * 3600))
MINECRAFT_MEMORY_ARGS="-Xmx2G -Xms2G"   # allocate 2gb of ram

# run ms server
nohup java ${MINECRAFT_MEMORY_ARGS} -jar server.jar nogui > nohup.out 2>&1 &
MINECRAFT_PID=$!
echo "Minecraft server started with PID: ${MINECRAFT_PID}"

# keep awake
gnome-session-inhibit --inhibit idle:sleep --reason "Minecraft Server Activity (timed inhibition)" sleep "${INHIBIT_DURATION_SECONDS}" &
INHIBIT_PID=$!
echo "Inhibition process started with PID: ${INHIBIT_PID}"

# manual kill
echo "To manually stop the inhibition before ${INHIBIT_DURATION_HOURS} hours, run:"
echo "  kill ${INHIBIT_PID}"

# Wait for the inhibition process to finish
wait $INHIBIT_PID
# shutdown the server
kill -SIGINT $MINECRAFT_PID
