<?PHP
/*
	# Disk Bars handler
	# Version: 1.0.0
	# Clayton Coleman

This script relies upon both rccFunctions.sh and disbars.sh to generate the disk utilization.

Note, the output of this script is a bar style meter of available disk space. That is, 
a disk that is Full (no empty space) would be: |___________ (1%)
a disk that is nearly empty would be : ||||||||||||||| (100%)

If you want to reverse the output to show how full the disk is, you can modify the script below and call the same function, but the colors will need to be reversed.
*/

$showHeader = true;

$header = shell_exec('printf "%10s" "Disk";printf "%15s" "Unused";printf "%15s" "U";printf "%9s" "Free";printf "%6s" "Total"');
$header .= "\n========================================================";

$disktext = shell_exec('df -Hl| grep "disk"');
$diskarr = explode("\n", trim($disktext));
#print_r($diskarr);
$diskarr = array_filter($diskarr, "isEmpty");
#print_r($diskarr);
$self = dirname(__FILE__);

$output = "";
foreach($diskarr as $diskline) {
   $diskline = filterMe($diskline);
   $n = explode(" ", $diskline);
   $n = array_values(array_filter($n, "isEmpty"));
   
   $dsk = array_pop(explode("/", $n[0]));
   $mntPoint = "/".array_pop(explode("/", $n[8]));
   
   $type = substr($n[1],-1);
   $total = (float)$n[1];
   $avail = (float)$n[3];
   $free = floor(($avail/$total)*100);
   $used = 100-$free;
   #echo "\n$used \n";
   
   #total	avail	free	used	label	mountpoint
   $output .= shell_exec("$self/diskbars.sh $total $avail $free $used $dsk $mntPoint $type");
   $output .= "\n";
}

if($showHeader)
	echo $header."\n".$output;
else
	echo $output;

function isEmpty($var) {
  if(strlen(trim($var)) == 0)
   return(false);
  else
  	return(true);
}

function filterMe($val) {
	$val = preg_replace('/[\p{Cc}]/', '', $val);
	return($val);
}
?>