#!/bin/bash

# Reusable functions for Geektool scripts.
# Version: 1.0.0
# Clayton Coleman


# These are the default colors I use. You can change them, but I recommend leaving baseColor alone.
# Functions may refer to these colors, removing them may cause errors. 

	lowColor="\033[31m"
	medColor="\033[1;33m"
	highColor="\033[1;36m"
	baseColor="\033[0m"

#location Variables, populated by running setLocation.
	locLat=""
	locLon=""
	locUpdated=""

	
# Gets the path of this script.
selfp=`echo $0 | rev | awk '{firstslash=index($0,"/");print substr($0,firstslash+1,length($0)); }' | rev`


# Gets the current location using CoreLocation Mac OS services. May not work on all computers in all locations.
# No parameters needed.

function setLocation {
# Location program whereami , found http://d.pr/f/C2qV 
	local x=`$selfp/whereami2 > ~/.curlocation`
	locLat=`cat ~/.curlocation | grep -m 1 -e "Lat" | awk '{print $2}'`
	locLon=`cat ~/.curlocation | grep -m 1 -e "Long" | awk '{print $2}'`
	locUpdated=`cat ~/.curlocation | grep -m 1 -e "Timestamp" | awk '{print $2$3}'`

}

# Converts an integer (0-100) to the corresponding letter value for use with ArcFont 
# Note, the cursor position is retained after printing the letter.
# ARCFont found here: http://goo.gl/ZmBjGx

function intToArc {
 local x=`echo "X$1X"|sed "s/X0X/a/;s/X1X/b/;s/X2X/c/;s/X3X/d/;s/X4X/e/;s/X5X/f/;s/X6X/g/;s/X7X/h/;s/X8X/i/;s/X9X/j/;s/X10X/k/;s/X11X/l/;s/X12X/m/;s/X13X/n/;s/X14X/o/;s/X15X/p/;s/X16X/q/;s/X17X/r/;s/X18X/s/;s/X19X/t/;s/X20X/u/;s/X21X/v/;s/X22X/w/;s/X23X/x/;s/X24X/y/;s/X25X/z/;s/X26X/A/;s/X27X/B/;s/X28X/C/;s/X29X/D/;s/X30X/E/;s/X31X/F/;s/X32X/G/;s/X33X/H/;s/X34X/I/;s/X35X/J/;s/X36X/K/;s/X37X/L/;s/X38X/M/;s/X39X/N/;s/X40X/O/;s/X41X/P/;s/X42X/Q/;s/X43X/R/;s/X44X/S/;s/X45X/T/;s/X46X/U/;s/X47X/V/;s/X48X/W/;s/X49X/X/;s/X50X/Y/"`
 echo -e "$x\c"
}

# Converts an integer value (0-100) to a corresponding bar. 
# E.g: Battery: |||||||||||_______ (60%)
# $highColor, $medColor, $lowColor colors are utilized (set in config section at top)
function pb {
	
	local Num=$1

	if [ ${#Num} != 0 ]
		then
			col=$highColor

		if [ $Num -lt 70 ]
			then
				col=$medColor
		fi
		if [ $Num -lt 33 ] 
			then
				col=$lowColor
		fi

		if [ ${#Num} = 0 ] 
			then
				echo -e "N/A"
			else
				typeset -i b=5
			while [ $b -le $Num ]
				do
				echo -e "$col|\c"
				b=`expr $b + 5`
			done
			echo -e "\033[0m\c"

			while [ $b -le 100 ]
				do
				echo -e "_\c"
				b=`expr $b + 5`
			done
			echo -e " ("$col"\c"
			printf "%3s" $Num
			echo -e $baseColor")%\c"
		fi
	fi
	unset col
}

