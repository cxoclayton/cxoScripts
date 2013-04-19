# cxoThings

An ApplesScript interaction that extracts information from [Things](http://culturedcode.com/) Task/To Do application using Applescript. The idea behind cxoThings was to create neatly formatted text files that could be embedded in a desktop using [GeekTool](http://projects.tynsoe.org/en/geektool/). 

## Files

* cxoThingsLib 

The basic cxoThings library that contains the functions that read from Things.

* cxoThingsBasic

A basic file that utilizes the cxoThingsLib to generate two files of To Dos for Today and Inbox.

## Example Usage

Calling the getThings method will return string of To Dos from the provided parameters.

    set todayInfo to ((getThings(1, "Today") of scriptLibrary))

This returns a string of To Dos from the Context -Today-.

    set workInfo to (getThings(0, "Work") of scriptLibrary)
    

This returns a string of To Dos from the Project "Work", if you have a Project called "Work".

For more information, explore the cxoThingsLib file.

# Roadmap

As I have time and/or need, I plan to add more features to the base library.

* Add filtering by Tag
* Add configuration for To Do output formatting.

# Changelog

## Version 1.0

Version 1.0 has basic filtering by Area, Project, or Context (like Today or Inbox).  