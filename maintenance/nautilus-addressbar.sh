#! /bin/bash

source ~/scripts/libcli.sh

echo set the Nautilus location bar
echo -e "\t* as an Address bar"
echo -e "\t* as a list of Icons"

OLDVAL=`gsettings get org.gnome.nautilus.preferences always-use-location-entry`

if askquestion "Use Icons or Address? (I/A)? " Ii Aa; then
#if askyesno "do you want to use icons? (Y/N)? "; then
	gsettings set org.gnome.nautilus.preferences always-use-location-entry false
else
	gsettings set org.gnome.nautilus.preferences always-use-location-entry true
fi

NEWVAL=`gsettings get org.gnome.nautilus.preferences always-use-location-entry`

echo "done"
sleep 1
echo "'org.gnome.nautilus.preferences always-use-location-entryr'"
echo "has been set to $NEWVAL"
echo "previous value : $OLDVAL, current value : $NEWVAL"
