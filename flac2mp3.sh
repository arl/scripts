#!/bin/bash
#!/bin/sh

# flactomp3.sh v0.01
# converts all flac files recursively found at $flacdir
# and creates MP3s of them at mp3dir, following any
# existing directory structure.
#
# Requirements
# lame, flac.


# TODO :  correct BUGS!

# BUGS : tags are not always preserved
 
#flacdir=/media/old_storage/Music/FLAC
flacdir="/home/panty/Music/Luke Vibert/Luke Vibert [Ridmik] [FLAC] [CodeTempest]"
mp3dir="/home/panty/Music/Luke Vibert/Luke Vibert/mp3"

# test to see if the mp3 directory exists: if not create it
if [ ! -d "$mp3dir" ]
then
  mkdir -p "$mp3dir"
fi

# main loop - we go into directories, make sure the mp3
# equivalent directory exists, create it if not, then
# convert each file across.

export IFS=$'\n'
for flac in $(find $flacdir -type f)
do

  # check we're dealing with a .flac
  if [ "${flac##/*.}" == "flac" ]
  then
  
  # replace flac directory structure with mp3 directory structure
    mp3="$mp3dir${flac#$flacdir}"
  # replace .flac extension with .mp3 extension
    mp3="${mp3%.flac}.mp3"
  
    #echo $flac \>\> $mp3
  # retrieve tags

    metaflac --export-tags-to=- "$flac" | sed 's/=\(.*\)/="\1"/' > /tmp/flacmeta.tmp
    . /tmp/flacmeta.tmp
    rm /tmp/flacmeta.tmp

  # check target directory exists, creating it if necessary
    targetdir="${mp3%/*.mp3}"
    if [ ! -d "$targetdir" ]
    then
      mkdir -p "$targetdir"
    fi
  
  # convert flac to mp3, preserving tags
    flac -dc "$flac" | lame -V 1 -q 0 --vbr-new -h \
      --tt "$TITLE"\
      --tl "$ALBUM"\
      --tn "$TRACKNUMBER"\
      --ty "$DATE"\
      --ta "$ARTIST"\
      --ty "${DATE%%-*}"\
      --id3v2-only\
      --replaygain-accurate\
      - "$mp3"
  fi
  
done
export IFS=" "
