#!/bin/bash
# backup.sh
# Written by: Ricardo Madriz<richin13[at]gmail[dot]com>
# Created by: Ricardo Madriz<richin13[at]gmail[dot]com>
# Date: March 19, 2017.
#
# This script takes a file as an argument and creates a backup copy.

# Instructions: place the following line in you .zshrc or .bashrc
# . /path/to/backup.sh
# Note the dot [.] at the beginning of the line.

# Usage: $ backup <file-to-backup>
# Note that you must have permissions to write in the current directory.

function backup() {
    if [ ${#} -lt 1 ]; then
        echo "ERROR: Missing required argument: <file-to-backup>";
        echo "Usage: $ backup <file-to-backup>"
        return 1
    else
        file=${1}
        if [ -f "$PWD/$file" ]; then
            name="$PWD/$file"
            backup_name="$file.$(echo "backup-made-$(date "+%d_%m_%Y-%k:%M:%S")")"
            if cp $name $backup_name ; then
                echo "Backup made. Saved as '$backup_name'";
                return 0
            else
                echo "Backup failed. Check directory permissions and try again."
                return 1
            fi
        else
            echo "ERROR: File '${1}' doesn't exist!";
            return 0
        fi
    fi
}

