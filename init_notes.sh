#!/bin/sh

# A simple shell script to initialize a notes folder
# Usage:
#    - To create a new notes folder, call
#      `init_notes.sh`
#    - To initialize an existing folder with the 
#      notes structure, call `init_notes.sh <PATH>`

# If a folder path was provided, cd into it
if [ $# -eq 1 ]; then
	cd $1 2> /dev/null
	# If `cd` failed, exit
	if [ $? -ne 0 ]; then
		echo "ERROR: $1 is not a valid directory."
		exit 1
	fi
# If no path is provided, and a notes folder
# exists in the current dir, cd into it
elif [ -d notes ]; then
	cd notes
# Otherwise, create a notes folder and cd into it
else
	mkdir notes
	cd notes
fi
# In the notes folder, create the img dir
# and symlink the makefile
if [ ! -d img ]; then
	mkdir img
	touch img/index
fi
if [ ! -f makefile ]; then
	ln -s `dirname $0`/makefile .
fi
