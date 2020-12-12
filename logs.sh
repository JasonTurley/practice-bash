#!/bin/sh
# Exercise: write a script that shows the time and date, lists all logged-in 
# users, and gives the system uptime. The script then saves this info to a 
# logfile.

LOG_FILE=logs

# Print each command to stdout and write to file
date   | tee -a  $LOG_FILE
who    | tee -a  $LOG_FILE
uptime | tee -a  $LOG_FILE

exit 0
