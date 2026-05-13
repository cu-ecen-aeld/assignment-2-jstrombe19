#!/bin/bash


# Write a shell script finder-app/writer.sh as described below

# Accepts the following arguments: the first argument is a full path to a file 
# (including filename) on the filesystem, referred to below as writefile; the 
# second argument is a text string which will be written within this file, 
# referred to below as writestr

# Exits with value 1 error and print statements if any of the arguments above 
# were not specified

# Creates a new file with name and path writefile with content writestr, 
# overwriting any existing file and creating the path if it doesn’t exist. 
# Exits with value 1 and error print statement if the file could not be created.

# Example:

#       writer.sh /tmp/aesd/assignment1/sample.txt ios

# Creates file:
#    /tmp/aesd/assignment1/sample.txt
# With content:
#    ios

################################################################################
#
##########                         REFERENCES                         ##########
#
#
# https://stackoverflow.com/questions/33416877/setting-ifs-for-a-single-statement
# https://stackoverflow.com/questions/8247433/remove-the-last-element-from-an-array
# 
################################################################################


function join_by { local IFS=/; echo "$*"; shift; }


if [ $# != 2 ]
then
    echo "Must provide a full filepath and text string to be written."
    echo
    echo "./writer.sh <filepath> <textstring>"
    exit 1
else
    writefile=$1
    writestr=$2
    IFS=/ arr=($writefile)
    # echo ${arr[@]}
    filename=${arr[-1]}
    # echo $filename

    unset arr[-1]
    # echo ${arr[@]}

    join_by ${arr[@]} | xargs mkdir -p
    
    touch "${writefile}"
    if [ $? != 0 ]
    then
        echo "File creation failed at ${writefile}."
	exit 1
    else
	echo $writestr > "${writefile}"
    fi
fi


