#! /bin/bash
die() {
    err=$1
    shift
    printf "%s\n" "$*"
    exit $err
}

for file in "$@"
do

  ## Check that the file exists...
  if [ ! -f "$file" ]
    echo didn\'t find $file
  then
    file=$defaultdir/$file
    ## ...and proceed to the next one if it doesn't
    [ -f "$file" ] || continue
  fi

    case $file in
        *.zip|*.ZIP) unzip "$file" ;;
        *.tar) tar xvpf "$file" ;;
        *.tgz|*tar.gz|*.tar.Z) gunzip -c  "$file" | tar xvpf - ;;
        *tar.bz2|*.tbz2) bunzip2 -c "$file" | tar xvpf - ;;

        ## gzipped and bzip2ed files are uncompressed to the current
        ## directory, leaving the original files in place
        *.gz) gunzip -c "$file" > "`basename "$file" .gz`" ;;
        *.Z) gunzip -c "$file" > "`basename "$file" .Z`" ;;
        *.bz2) bunzip2  -c "$file" > "`basename "$file" .bz2`" ;;
        *.rpm)
            ## Create directory named for the file (without .rpm)
            dir=`basename "$file" .rpm`
            mkdir -p "$dir" || die 5 "Could not create $dir"
            (
               cd "$dir" || die 4 "Could not cd to $dir"
               rpm2cpio "$file" | cpio -dim
            )
            ;;
        *.deb)
            ## Create directory named for the file (without .deb)
            dir=`basename "$file" .deb`
            mkdir -p "$dir" || die 3 "Could not create $dir"
            (
               cd "$dir" || die 2 "Could not cd to $dir"
               ar -x "$file"
               [ -f control.tar.gz ] && gunzip -c  control.tar.gz | tar xvp
               [ -f data.tar.gz ] && gunzip -c  data.tar.gz | tar xvp
            )
            ;;
    esac
done
