#! /bin/bash
# functions for command line interface scripts

# ask user to answer to a question
# $1 : question to ask
# $2 : char(s) accepted as 1st answer => if askquestion (true) => 0
# $3 : char(s) accepted as 2nd answer => else (false) => 1
function askquestion()
{
	question=${1}
	shift
	choices=( "$@" )

	echo -ne $question
	while read -r -n 1 -s answer; do
	  if [[ $answer = [${choices[0]}${choices[1]}] ]]; then
		[[ $answer = [${choices[0]}] ]] && retval=0
		[[ $answer = [${choices[1]}] ]] && retval=1
		break
	  fi
	done

	echo # just a final linefeed, optics...

	return $retval
}


# ask user to answer to a Yes/No question
# $1 : question to ask
function askyesno()
{
	askquestion "${1}" Yy Nn
	return $?
}

# are you sure?
# from http://wiki.bash-hackers.org/start
function asksure()
{
	askyesno "Are you sure (Y/N)? "
	return $?
}

# press any key to continue
# $1 : key expected to continue program execution
#		or 'any' (default )
function pressakey()
{
	key=${1:-'any'}
	msg=${2:-"Press '$key' key to continue..."}

	echo -en $msg

	while read -s -r -n 1 key_pressed; do
	  if [ $key == "any" ] || [ "$key" = "$key_pressed" ] ; then
			break
	  fi
	done

}
# TODO : remove waitforkey ==> pressakey() integrates and expand same functionality
# do not return until user has pressed a key
function waitforkey()
{
	while read -n 1 -s key; do
	  if [[ $key = "${1}" ]] ; then
		break
	  fi
	done
}

# prints a progress bar of bar_len length
# ex : progress_bar 3 10 20 T ' '
# will print : 
# TTTTT              30%
# recalling progress_bar again without having written on stdout will overwrite previous line
function progress_bar()
{
	current=$1
	max=$2
	barlen=${3:-50} # defaults to 50 char lengths
	barchar=${4:-#} # defaults to #
	remainbar=${5:-'-'} # defaults to -

	# compute current percentage
	((percent=($current*100)/$max))

	# compute number of chars to write
	((currentchar=($percent*$barlen)/100))
	 
	bar=''
	remain=''

	for((i=1;i<$currentchar;i++))
	do
		bar+=$barchar
	done
	for((i=$currentchar;i<$barlen;i++))
	do
		remain+=$remainbar
	done

	echo -ne "$bar$remain$percent"'%\r'
}

