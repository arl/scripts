#! /bin/bash
#remove all origin tags
git tag -l | xargs -n 1 git push --delete origin
