#! /bin/bash

# to be used like this : 
#	if is_integer $1; then echo yes; else echo no; fi
function is_integer()
{
	if [[ $1 =~ ^-?[0-9]+$ ]] ; then
		return 0
	fi
	return 1
}

