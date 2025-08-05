#!/bin/bash
# we want journalctl -f to run in the background in case we desire to add more script or just don't want to see the terminal
# spit out all the crap that we're logging. trap tells script that when Control+C is hit we tell user that we are Shutting down
# all background processes that the script started and then we do it with the kill command, finally exit. 

trap 'echo "Shutting down..."; kill $(jobs -p); exit' SIGINT


# cleaner and more elegant way of capturing our warnings, etc. check out forgegaurd.log for results

journalctl -f -o short-iso | grep -Ei 'sudo|usb|mount|login|error|warn' >> ~/Homework/forgeguard.log &

# don't hit the end of the script yet, let user decide when to end process
wait
