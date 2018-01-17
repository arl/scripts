#! /usr/bin/env bash


# recursively look for the last n (default 1) modified files in a directory

N=${1:-1}

find . -type f -printf '%T@ %p\n' | sort -n | tail "-$N" | cut -f2- -d" "
