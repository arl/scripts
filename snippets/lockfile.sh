#! /bin/bash


if [ ! -e $lockfile ]; then
   trap "rm -f $lockfile; exit" INT TERM EXIT
   touch $lockfile
   critical-section # commands that should never be ran by different processes at same time
   rm $lockfile
   trap - INT TERM EXIT
else
   echo "critical-section is already running"
fi
