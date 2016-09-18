#!/bin/bash
# search-alias.sh
# Created by: Ricardo Madriz<richin13[at]gmail[dot]com>
# Written by: Ricardo Madriz<richin13[at]gmail[dot]com>
#
# Prints all the aliases containing the provided <keyword>

# Instructions: place the following line in your .zshrc or .bashrc
# . /path/to/search-alias.sh
# (Note the dot [.] at the beginning of the line)

function searchalias() {
    if [ ${#} -lt 1 ]; then
        echo "Missing required arguments: <keyword>"
        exit 1
    fi
    alias | grep "${*}" # as simple as that lol
}

# !OPTIONAL
# alias srchal="searchalias"
