# Quickly compute a hash of the files contained in a directory

    find . -type f -exec md5sum {} + | awk '{print $1}' | sort | md5sum
