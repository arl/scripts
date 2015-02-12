#! /bin/bash

# create a visual representation of a folder's content
# represents the folders but not the files they contain

DIR=${1:-.}

if [ -d "${DIR}" ]
	then
		pushd $DIR >> /dev/null
		ls -R | grep ":$" | sed -e 's/:$//' -e 's/[^-][^\/]*\//--/g' -e 's/^/   /' -e 's/-/|/'
		popd >> /dev/null
	else
		echo "error : directory \"${DIR}\" doesn't exist"
		exit 1
fi
