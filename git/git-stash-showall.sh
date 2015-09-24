#! /bin/bash
#
# show the content of all stashes
git stash list | awk -F: '{ print "\n\n\n\n"; print $0; print "\n\n"; system("git stash show -p " $1); }'

