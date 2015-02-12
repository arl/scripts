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

	echo -n $question
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
