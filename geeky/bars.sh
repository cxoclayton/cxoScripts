#!/bin/bash

# Bars script
# Version: 1.0.0
# Clayton Coleman

# Currently includes support for Battery, Apple Magic Mouse (bluetooth), Apple Magic Trackpad (bluetooth), and Apple Bluetooth Keyboard.

selfp=`echo $0 | rev | awk '{firstslash=index($0,"/");print substr($0,firstslash+1,length($0)); }' | rev`
source $selfp/rccFunctions.sh


battery=`ioreg -l | awk '$3~/Capacity/{c[$3]=$5}END{OFMT="%.0f%";max=c["\"MaxCapacity\""];print(max>0?100*c["\"CurrentCapacity\""]/max:"?")}'| awk '{print int($1)}'`
keyboard=`ioreg -c AppleBluetoothHIDKeyboard | grep BatteryPercent | sed 's/[a-z,A-Z, ,|,",=]//g' | tail -1 | awk '{print $1}'`
mouse=`ioreg -c BNBMouseDevice | grep BatteryPercent | sed 's/[a-z,A-Z, ,|,",=]//g' | tail -1 | awk '{print $1}'`
trackpad=`ioreg -c BNBTrackpadDevice | grep BatteryPercent | sed 's/[a-z,A-Z, ,|,",=]//g' | tail -1 | awk '{print $1}'`

printf "%16s" "Battery: "
pb  $battery
echo

printf "%16s" "Mouse: "
if [ "$mouse" != "" ];then
	pb $mouse 
else
   echo -e "Disconnected\c"
fi
echo

printf "%16s" "Keyboard: "
if [ "$keyboard" != "" ];then
	pb $keyboard
else
   echo -e "Disconnected\c"
fi
echo

printf "%16s" "Trackpad: "
if [ "$trackpad" != "" ];then
	pb $trackpad 
else
   echo -e "Disconnected\c"
fi
echo

