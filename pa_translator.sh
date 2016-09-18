#!/bin/bash
# pa_translator.sh
# Created by: Ricardo Madriz<richin13[at]gmail[dot]com>
# Written by: Ricardo Madriz<richin13[at]gmail[dot]com>
#
# Takes a plane's registration number and translate to human-readable notation
# using NATO phonetic alphabet [pa].

# All the codes taken from wikipedia. 
# See <https://en.wikipedia.org/wiki/NATO_phonetic_alphabet>
declare -A codes
codes=(["A"]="Alfa" ["B"]="Bravo" ["C"]="Charlie" ["D"]="Delta" ["E"]="Echo" ["F"]="Foxtrot" ["G"]="Golf" ["H"]="Hotel" 
        ["I"]="India" ["J"]="Juliet" ["K"]="Kilo" ["L"]="Lima" ["M"]="Mike" ["N"]="November" ["O"]="Oscar" ["P"]="Papa" 
        ["Q"]="Quebec" ["R"]="Romeo" ["S"]="Sierra" ["T"]="Tango" ["U"]="Uniform" ["V"]="Victor" ["W"]="Whiskey" 
        ["X"]="X-ray" ["Y"]="Yankee" ["Z"]="Zulu" ["1"]="One" ["2"]="Two" ["3"]="Three" ["4"]="Four" ["5"]="Five" 
        ["6"]="Six" ["7"]="Seven" ["8"]="Eight" ["9"]="Nine" ["0"]="Zero")

if [ $# -lt 1 ]; then
    echo "Error: no registration number given"
    exit 1
fi
# Vague regex to test if registration number is given in upper-case style and
# do not contains weird characters.
if ! [[ $1 =~ ^([0-9A-Z]+|[0-9A-Z]+\-[0-9A-Z]+)$ ]]; then
    echo "Error: malformed registration number"
    exit 2
fi
license=$1
count=${#license}
index=0
printf "$license: "
while [ $index -lt $count ];do
    digit=${license:$index:1}
    if [ "$digit" != "-" ]; then
        printf "${codes[$digit]}"
        
        if [ $((index+1)) -ne $count ]; then
            printf ", " # Custom separator. choose wisely
        fi
    fi
    index=$((index+1))
done
echo
