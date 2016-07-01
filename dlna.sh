# /usr/bin/env bash
## dlna start (or restarts) an minidlna server
## As only the root user may modify the state of a service, sudo or gksudo will
## be invoked, depending from where this script is called
##     * bash : sudo
##     * gui/cairo-dock/anywhere else : gksudo
##
## Usage: dlna [-f]
## Options:
##   -h, --help    Display this message.
##   -f, --force   Force full database rescan
##

usage() {
  [ "$*" ] && echo "$0: $*"
  sed -n '/^##/,/^$/s/^## \{0,1\}//p' "$0"
  exit 2
} 2>/dev/null

main() {
  while [ $# -gt 0 ]; do
    case $1 in
    (-h|--help) usage 2>&1;;
    (-f|--force) FORCE=1; shift;;
    (--) shift; break;;
    (-*) usage "$1: unknown option";;
    (*) break;;
    esac
  done

  PARENT_COMMAND="$(ps -o comm= $PPID)"
  SUDO=$(which gksudo)
  if [[ $PARENT_COMMAND == "bash" ]]; then
    SUDO=$(which sudo)
  fi
  # fullrescan is not always necessary, seems to depend on the version
  if [[ $FORCE ]]; then
    echo restarting minidlna service with full database rescan
    $SUDO minidlnad -R -f /etc/minidlna.conf && sudo service minidlna restart 
  else
    echo restarting minidlna service
    $SUDO service minidlna restart
  fi
}

main "$@"
