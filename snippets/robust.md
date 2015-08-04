mostly taken from the great information at http://www.davidpashley.com/articles/writing-robust-shell-scripts/


## bash

### set -u

use `set -u` will exit your script if you try to use an uninitialised variable.

### set -e

write  `set -e` at the top of a script and this tells bash that it should exit the script if any statement returns a non-true return value
so that 
```
command
if [ "$?"-ne 0]; then echo "command failed"; exit 1; fi
```
 can be replaced by:
```
command || { echo "command failed"; exit 1; }
```

disable temporarily with 
```
set +e
command1
command2
set -e
```


### spaces in filenames

they are treated normally by enclosing filenames and variables by quotes, like in `if [ "$filename" = "foo" ];`
