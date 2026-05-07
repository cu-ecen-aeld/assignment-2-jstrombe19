#!/bin/bash

# Write a shell script finder-app/finder.sh as described below:

# Accepts the following runtime arguments: the first argument is a path to a directory on the filesystem, referred to below as filesdir; the second argument is a text string which will be searched within these files, referred to below as searchstr

# Exits with return value 1 error and print statements if any of the parameters above were not specified

# Exits with return value 1 error and print statements if filesdir does not represent a directory on the filesystem

# Prints a message "The number of files are X and the number of matching lines are Y" where X is the number of files in the directory and all subdirectories and Y is the number of matching lines found in respective files, where a matching line refers to a line which contains searchstr (and may also contain additional content).

# Example invocation:

#        finder.sh /tmp/aesd/assignment1 linux

# 01:06:22 - 06 MAY 2026

if [ $# != 2 ]
then 
    echo "Must provide a path to a directory on the filesystem and a text string to be searched within the files at that location."
    echo " ./finder.sh <path> <string>"
    exit 1
fi

filesdir=$1
searchstr=$2

filecnt=0
linecnt=0

filecount() {
    ls -R1 $filesdir | [ -d ]
}

if [ -d $filesdir ]
then
    filecount
    echo "The number of files are ${filecnt} and the number of matching lines are ${linecnt}"
    exit 0
else
    echo "The path provided is not a directory."
    exit 1
fi




