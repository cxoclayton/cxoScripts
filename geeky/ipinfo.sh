 #! /bin/bash 

myen0=`ifconfig en0 | grep "inet " | grep -v 127.0.0.1 | awk '{print $2}'` 

if [ "$myen0" != "" ] 
then 
echo "Ethernet : IP - $myen0" 
else 
echo "Ethernet : INACTIVE" 
fi 

myen1=`ifconfig en1 | grep "inet " | grep -v 127.0.0.1 | awk '{print $2}'` 

if [ "$myen1" != "" ] 
then 
myvar1=`/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I | grep -e "SSID:" | tail -n 1 | awk '{print $2}'` 
myvar2=`/System/Library/PrivateFrameworks/Apple80211.framework/Versions/A/Resources/airport -I | grep -e "channel:" | awk '{print $2}'` 
echo "AirPort : IP - $myen1 
Network - $myvar1 
Channel - $myvar2" 
else 
echo "Airport : INACTIVE" 
fi 
