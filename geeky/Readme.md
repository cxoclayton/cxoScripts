# Geeky 

I use [GeekTool](http://projects.tynsoe.org/en/geektool/) as a means to put many things on my desktop. I'm a big fan of plain text files, bash scripts, and other things. You can find general files in this directory with subsequent directories dedicated to  specific functions or applications. Most of these scripts are for a Mac OS machine, so please use them at your own risk.  

# Dependencies

I use a few helper scripts that enhance some of my tools. [whereami](http://d.pr/f/C2qV) is an OSX command line tool that prints out GeoLocation. [iCalBuddy](http://hasseg.org/icalBuddy/) is a great way to convert calendar information into text.  I also use PHP, which does ship with OSX so that shouldn't be a problem. 


# My Scripts


* Bars.sh - A script that outputs bar style meters for Laptop, mouse, trackpad, and keyboard battery. Output is colorized. Script depends on the rccFunctions.sh file which must be located in the same directory as many of these scripts.

```
	 Battery: |||||||||||||||||||_ ( 99)%
	   Mouse: Disconnected
	Keyboard: |||||||||||||||||||_ ( 96)%
	Trackpad: |||||||||___________ ( 48)%
```

* ipinfo.sh - A script that prints network interface and wireless details. Unlike most scripts, this script identifies when new ethernet adapters are added dynamically, like docking to an Apple Thunderbolt Display. 

```
Internet:  ***.***.***.127
      en5:  ***.0.1.4
      en0:  ***.0.***.5
     SSID:  ****ssdid
     Auth:  wpa2-psk
  Channel:  149,1
```

* bars_disk.php &amp; diskbars.sh - A combination PHP and bash script that generates the same bar style output for disk information. I couldn't figure out how to do this in bash, so I used PHP and called bash. It does minimize calls to the utility.


	   Disk         Unused              U     Free Total
	========================================================
				 /: ||||||||||__________ ( 54)%  409G  750G
			  /Eon: ||||||||||||||||||__ ( 92)%  3.7T  4T
		  /HGWells: ||||||||||||||||____ ( 80)%  2.4T  3T
		/Transcend: |||||||||||||||||||| (100)%  129G  129G

# iCalBuddy
I use [iCalBuddy](http://hasseg.org/icalBuddy/) so much in my GeekTool scripts that I believe it really deserved its own section. iCalBuddy is great for making plain text of your calendars. For the most part it's a planning tool, but it can be great for knowing what's on my today list. 

A few tips I have learned for iCalBuddy is to use the __eventsFrom__ and __to__ date parameters to show relevant information in different blocks on my screen. For example, I may only want to show events for today so I can use __eventsToday__ parameters. However, I may want to see events for the next few days.

## Events for the next 3 days
By using the __eventsFrom__ and __to__ parameters, and a little bash, you can output events for the next few days using a quick bash script:

	#!/bin/bash
	start=`date -v+1d "+%m/%d/%Y"`
	end=`date -v+3d "+%m/%d/%Y"`
	ToDo=`/usr/local/bin/icalbuddy eventsFrom:"$start" to:$end` 

Alternatively, you can include a timestamp to add more precision to your iCalBuddy output. In Calendar, there's a running line that tracks the current time and turns past events to gray. For iCalBuddy, I specify a window slightly greater so that when I'm running late I can still see the details for meetings.

	start=`date -v-30M "+%m/%d/%Y %H:%M"`
	end=`date -v+0d "+%m/%d/%Y"`

# Screenshot

![Screenshot of my geeklets in action](/geeky/screenshot.jpg)



