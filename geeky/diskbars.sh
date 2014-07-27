#!/bin/bash

# Script that takes input from bars_disk.php script to generate the bar information.
# Version: 1.0.0
# Clayton Coleman

selfp=`echo $0 | rev | awk '{firstslash=index($0,"/");print substr($0,firstslash+1,length($0)); }' | rev`
source $selfp/rccFunctions.sh

#total	avail	free	used	label	mountpoint
#  1      2       3      4        5        6

printf "%15s" $6":"
echo -e " \c"
pb $3

printf "%6s" "$2$7"
echo -e "  \c"
printf "%-6s" "$1$7"






