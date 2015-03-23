#! /bin/bash

source ../libcli.sh # for pressakey function

clear
tmpfile="$(mktemp)" > /dev/null

echo -e
echo -e this script/tutorial demonstrates simple use of 'xwininfo & xprop'
echo -e retrieves a series of properties about a specific opened window
echo -e
echo -e example of use : 
echo -e "\tonce, i couldn't put fullscreen window back to windowed mode"
echo -e "\tand i needed to close/kill it"
echo -e "\tone way to do so was to obtain the pid of the process owning the"
echo -e "\twindow pid that i couldn't obtain from ps"
echo -e
echo -e
echo -e
echo -e \'xwininfo\' let the user select any window with the mouse, in order to
echo -e print general info about the window targeted by the user
xwininfo | tee "$tmpfile"

# extract pid
_pid_=$(grep "Window id:" "$tmpfile" | egrep -o '0x[0-9a-f]+\b')
echo -e from the various information displayed, one line gives the Window id
echo -e in our case, it is :
echo -e
echo -e 
echo -e "\t" $(grep "Window id:" "$tmpfile")
echo -e
echo -e
echo -e
echo -e then, we can call xprop to give us more detailed
echo -e information about the window
echo -e
pressakey any "\tpress any key to see the output of 'xprop -id $_pid_'"
echo -e
xprop -id $_pid_ | tee "$tmpfile"
echo -e 
echo -e
echo -e
echo -e one line gives the pid, in our case, it is :
echo -e
echo -e
echo -e 
grep _NET_WM_PID "$tmpfile"
echo -e
echo -e
echo -e

