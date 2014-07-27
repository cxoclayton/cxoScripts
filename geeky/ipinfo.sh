#! /bin/bash 
# IP Information bash script for GeekTool.
# Version: 1.0.0
# Clayton Coleman

# 
	lowColor="\033[31m"
	baseColor="\033[0m"


#External IP obtained from DynDNS and should not be done too frequently.
externalIP=`curl --silent http://checkip.dyndns.org | awk '{print $6}' | cut -f 1 -d "<"`
printf "%10s" "Internet:"
if [ "$externalIP" != "" ];
	then
	  echo -e "  $externalIP"
else
	echo -e $lowColor"\tNo Internet"$baseColor
fi



#First, get a list of all adapters.
iflist=`ifconfig -l`

#Loop through each one, filter out those that have internal IP assigned.
# Prints a list of {interface}:{IP Address} , eg: en0: 192.168.1.103
# Ignores 127.0.0.1 (internal loopback) addresses. 
for i in $iflist;
	do
	ei=`ifconfig $i | grep "inet " | grep -v 127.0.0.1 | awk '{print $2}'`
	if [ "$ei" != "" ]; then
		printf "%10s" "$i:"
		echo -e "  $ei"
	fi
done

# Obtain airport information.
ap=`/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I | grep -v "Off"`

if [ "$ap" != "" ]; 
	then
	ssid=`/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I | grep -v "Off" | grep "SSID" | grep -v "BSSID" | awk '{print $2}'`
	printf "%10s" "SSID:"
	echo -e "  $ssid"
	
	apauth=`/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I | grep -v "Off" | grep "auth:" | grep -v "802.11" | awk '{print $3}'`
	printf "%10s" "Auth:"
	echo -e "  $apauth"

	apchnl=`/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I | grep -v "Off" | grep "channel:" | awk '{print $2}'`
	printf "%10s" "Channel:"
	echo -e  "  $apchnl"
fi
	
	
