#! /bin/bash
# return the permission in octal of file given in parameter
stat -c "%a %n" $1
