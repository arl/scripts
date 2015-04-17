#! /bin/bash
#
# simple script to restart the minidlna server
# detect from where we are call : 
#   bash : call sudo
#   gui or cairo-dock or anywhere else : call gksudo
PARENT_COMMAND="$(ps -o comm= $PPID)"
SUDO=$(which gksudo)
if [[ $PARENT_COMMAND == "bash" ]]; then
	SUDO=$(which sudo)
fi
# before we were forcing a fullrescan, that doesn't seem necessary anymore
#$SUDO minidlnad -R -f /etc/minidlna.conf && sudo service minidlna restart 
$SUDO service minidlna restart
