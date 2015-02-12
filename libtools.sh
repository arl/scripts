#! /bin/bash


# function	:	log WHAT [datefmt]
#
#	datefmt can be preconfigured so as to not pass it each time
#	set $log_datefmt variable to whatever the 'date' command accepts
#	or set it to 'no' to log without date
#
log()
{
	datefmtdefault="+%Y/%m/%d %H:%M:%S"
	datestring=
	if [ -v log_datefmt ] 
	then 
		# logdate has been set
		if [ $log_datefmt == "no" ] 
		then 
			datestring=""
		else
			datestring=`date "$log_datefmt"`"\t: "
		fi
	else
		datestring=$(date "$datefmtdefault")"\t: "
	fi

	logargs="$datestring$1"

	for (( argn=2; argn<=$#; argn++ ))
		do
		logargs="${logargs}\t${!argn}"
	done
	echo -e "${logargs}"
}


timestamp()
{
	date +%Y%m%d-%H%M-%S
}


