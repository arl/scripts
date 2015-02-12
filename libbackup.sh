#! /bin/bash

. libfilename.sh
. libtools.sh


# NAME
#        backup_filename - generates a name for backup file
#
# SYNOPSIS
#        backup_filename [DIR [NAME]]
# 
# DESCRIPTION
#         
#        Generates a unique name for backup file.
#        if DIR is not specified, DIR is ./
#        if NAME is not specified, NAME is the last component of $PWD
#        Unique name is generated using following pattern :
#          DIR/NAME.timestamp.tgz
# 
function backup_getfilename()
{
	if [ $# -eq 0 ]
	then
		dir="./"
		name=$(get_filename $PWD)
	elif [ $# -eq 1 ]
	then
		dir="${1}/"
		name=$(get_filename $PWD)
	else
		dir="${1}/"
		name="${2}"
	fi
	echo "${dir}${name}.$(timestamp).tgz"
}





