#!/bin/bash
# cd-wrapper.sh
# Created by: Ricardo Madriz<richin13[at]gmail[dot]com>
# Written by: Ricardo Madriz<richin13[at]gmail[dot]com>
#
# Takes a directory name, creates it (if it doesn't exists yet)
# and then cd into it.

# To use this, add the following line to your bashrc or zshrc 
# (others may also apply)
# . /path/to/cd-wrapper.sh
# Change /path/to to the actual path of the cd-wrapper.sh file
# (Note the dot [.] at the beginning of the line)

function cdc() {
	if [ ${#} -eq 1 ]; then
    	if ! [ -d "${1}" ]; then
    		mkdir -p "${1}"
    	fi
    fi  
    cd "${1}"
}
