#! /bin/bash

sheetspath="$(dirname $(realpath $0))/cheatsheets"

function print_usage()
{
	exit_code=${1:-0}
	user_msg=${2:-''}
	if [ -n $user_msg ]; then
		echo "cheat : no arguments given..."
		echo
	fi
	echo -e "usage : cheat [OPTIONS] COMMAND\t"
	echo "cheat prints cheat sheet of some famous unix commands, like awk, sed, ed, and screen"
	echo
	echo -e "  COMMAND may be:"
	echo -e "\t\tawk\tfor awk cheat sheet"
	echo -e "\t\tsed\tfor sed cheat sheet"
	echo -e "\t\ted\tfor ed commands cheat sheet"
	echo -e "\t\tvim\tfor vim command cheat sheet for programmers"
	echo -e "\t\tscreen\tfor screen cheat sheet"
	exit $exit_code
}

if [ $# -lt 1 ]; then
	print_usage 1
fi
if [ "$1" = "-h" ] || [ "$1" = "--help" ] ; then
	print_usage 0
fi

if [ ! -d "${sheetspath}" ]; then
    echo cheatsheets directory "'"$cheapath"'" does NOT exist
    exit 1
fi

cmdname=$1

case $cmdname in
	awk)	cheatfile="${sheetspath}/awk.cheat.sheet.txt" ;;
	ed)		cheatfile="${sheetspath}/ed.unix.text.editor.cheat.sheet.txt" ;;
	sed)	cheatfile="${sheetspath}/sed.stream.editor.cheat.sheet.txt" ;;
	screen)	cheatfile="${sheetspath}/screen.cheat.sheet.txt" ;;
	vi|vim)	cheatfile="${sheetspath}/vim-for-programmers.cheat.sheet.txt" ;;
	*)		echo "no cheat sheet found for $cmdname"
			exit 3
			;;
esac

less -f $cheatfile
