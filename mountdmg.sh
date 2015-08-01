#! /bin/bash
#
# author  : aurelien rainone
# email   : aurelien-rainone [AT] gmail [DOT] com
# license : MIT
# description:
#   mountdmg let you mount on linux a Mac OSX dmg image
#   to analyze its content or access its resources for 
#   example, note that in no way you'll be able to 
#   run it ;-) at least that i'm aware of...
# warning:
#   won't open all kinds of dmg images for sure
#   but at least the ones created with hdiutil and its
#   set of default options
 
function usage()
{
cat <<EOF
mountdmg (v0.1)
mountdmg will extract the content of a mac osx .dmg file so that its
content can be examined
Warning: note all types of dmg images are supported
could require the use of 7z (apt-get install p7zip-full on debian based
distros)
usage: mountdmg -t filesystem -d mount_dir [-p part_dir] dmg_file
        Command Summary:
                -d              Directory where dmg_file will be mounted
                -t              Type of filesystem to mount
                -p              Directory where place dmg partition
                                (default to current directory)
                -v              Add more messages
                -h              Print usage

example:
  mountdmg.sh -t hfsplus -d /mnt mymdg.dmg
EOF
}

# get scriptname for logs
scriptname=${0##*/}

# cleanup at exit
function cleanup()
{
popd > /dev/null
#echo $scriptname: cleaning up...
rm -rf $tmpdir
}
trap cleanup EXIT
pushd . > /dev/null
 
# default option values
partdir=$(pwd)

options=':hvt:d:p:'
while getopts $options option
do
  case $option in
    t)    fs=$OPTARG;;
    d)    mntdir=$OPTARG;;
    p)    partdir=$OPTARG;;
    h)    usage; exit;;
    \?)   echo "Unknown option: -$OPTARG" >&2; exit 1;;
    :)    echo "Missing option argument for -$OPTARG" >&2; exit 1;;
    *)    echo "Not implemented option: $option" >&2; exit 1;;
  esac
done
shift $(($OPTIND - 1))

[[ -z "$fs" ]] && echo "-t is a mandatory option" >&2 && exit 1
[[ -z "$mntdir" ]] && echo "-d is a mandatory option" >&2 && exit 1

[[ $# -ne 1 ]] && echo "dmg_file must be provided" >&2 && exit 1

dmg=$1
echo dmg is $1

# create tmp dir and cd to it
tmpdir=$(mktemp -d -t $scriptname.XXXXXXXXXX)
cd $tmpdir > /dev/null

# extract dmg file
7z x $dmg || echo "$scriptname: quitting on 7z error" >&2

# loop for hfs extracted
for file in *; do
  if file "${file}" | grep -Eq -i 'macintosh|hfs' ; then
    # found mountable dir
echo copy $file to $partdir
    cp "${file}" "${partdir}"
    sudo mount -t $fs -o loop "${file}" $mntdir
    [[ $? -ne 0 ]] && echo "$scriptname: error, couldn't mount $file" >&2 && exit 2

    target=$(findmnt | grep $fs | tail -n 1 | awk -F" " '{print $2}')
    echo "$scriptname: successfully mounted $file on $target"
    echo "$scriptname: run sudo umount $target when finished"
    exit
  fi
done

echo "$scriptname: coudn't find suitable partition type"
exit 1
# vim: set ts=2 sw=2 sts=2 et sta:
