#!/bin/bash
# Cleanup, version 3

# Warning:
# -------
# This script uses quite a number of features that will be explained
# later on.
# By the time you've finished the first half of the book, there should be 
# nothing mysterious about it.


LOG_DIR=/var/log
ROOT_UID=0		# Only users with $UID 0 have root privileges.
LINES=50		# Default number of lines saved.
E_XCD=86		# Can't change directory?
E_NOTROOT=87		# Non-root exit error.

# Run as root, of course.
if [ "$UID" -ne "$ROOT_UID" ]
then
	echo "Error: only the root user can run this script."
	exit $E_NOTROOT
fi

if [ -n "$1" ]
# Test whether command-line argument is present (not-empty).
then 
	lines=$1
else
	lines=$LINES	# Default, if not specified on command-line.
fi


# Efficient check that we are in the right directory before cleaning log files.
cd $LOG_DIR || {
	echo "Error: can't change to $LOG_DIR." >&2
	exit $E_XCD;
}

tail -n $lines messages > mesg.temp	# Save last section of message log file.
mv mesg.temp messages			# Rename it as system log file.

# cat /dev/null > messages
#* No longer needed, as the above method is safer.

cat /dev/null > wtmp

echo "Logs cleaned up."

exit 0 	
