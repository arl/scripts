#! /bin/bash
#
# simple script to restart the minidlna server
# forcing a rescan of the scanned folders
sudo minidlnad -R -f /etc/minidlna.conf && sudo service minidlna restart 
