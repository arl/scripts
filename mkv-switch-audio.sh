#! /bin/bash
## mkv-switch-audio prints a command that switches
## track 2 with track 3 in a MKV file.
## (track:1 is video track)

usage() {
  [ "$*" ] && echo "$0: $*"
  sed -n '/^##/,/^$/s/^## \{0,1\}//p' "$0"
  exit 2
} 2>/dev/null

main() {
  while [ $# -gt 0 ]; do
    case $1 in
    (-h|--help) usage 2>&1;;
    (-*) usage "$1: unknown option";;
    (*) break;;
    esac
  done
  echo mkvpropedit -v '$NAME' --edit track:2 --set track-number=3 --edit track:3 --set track-number=2
}

main "$@"
