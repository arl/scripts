#! /bin/bash

# return extension of file given as parameter
function get_extension {

	filename=$(basename "${1}")
	extension="${filename##*.}"
	echo "${extension}"
}


# return filename without extension of file given as parameter
function get_filename {

	filename=$(basename "${1}")
	filename="${filename%.*}"
	echo "${filename}"
}

