#! /bin/bash

oneliners="$(dirname $(realpath $0))/oneliners"

function print_usage()
{
	exit_code=${1:-0}
	echo
	echo -e "usage : oneline [-x] COMMAND [NUMBER]\t"
	echo "oneliner prints a document containing some oneliners about a unix famous command"
	echo "awk(3), sed(3) and perl(6) are available at the moment"
	echo
	echo -e "  -x|--explained\tto obtain the exlained version of a one liner document"
	echo -e "                \tnot available for perl"
	echo -e "  NUMBER\t\tis the number of the expained document version to print (default to 1)"
	echo -e "  COMMAND may be:"
	echo -e "\t\tsed\tfor sed oneliner sheet"
	echo -e "\t\tawk\tfor awk oneliner sheet"
	echo -e "\t\tperl\tfor perl oneliner sheet (only with --explained option)"
	exit $exit_code
}

explained=false

if [ $# -lt 1 ]; then
	echo "oneliner : not enough arguments given..."
	print_usage 1
fi
if [ "$#" = "-h" ] || [ "$#" = "--help" ] ; then
	print_usage 0
fi
if [ "$1" = "-x" ] || [ "$1" = "--explained" ] ; then
	explained=true
	shift
fi

cmdname=$1
docnumber=${2:-1}

if [ "$explained" = "false" ] && [ $cmdname = "perl"  ]; then
	echo "oneliner : only explained version of perl oneliners available..."
	print_usage 3
fi

case "$cmdname$docnumber" in

	awk[123]|sed[123]|perl[123456])
				
				if [ "$explained" = "true" ]; then
					onelinerfile="$oneliners/$cmdname-oneliner-$docnumber.txt"
				else
					onelinerfile="$oneliners/$cmdname-oneliner.txt"
				fi
				;;
	awk*|sed*|perl*)
				echo "there is no $cmdname oneliner document having number $docnumber"
				exit 2
				;;
	*)			echo "no oneliner document found for $cmdname"
				exit 3
				;;
esac

less -f $onelinerfile
