# GNU Make Cheatsheet #

Copied from https://gist.github.com/rueycheng/42e355d1480fd7a33ee81c866c7fdf78
Based on <https://www.gnu.org/software/make/manual/html_node/Quick-Reference.html>

## Directives ##

|Directive                       |Description                                                                            |
|:-------------------------------|:--------------------------------------------------------------------------------------|
|`define variable` <br/> `define variable =` <br/> `define variable :=` <br/> `define variable ::=` <br/> `define variable +=` <br/> `define variable ?=` <br/> `endef`|Define multi-line variables.|
|`undefine variable`             |Undefining variables.                                                                  |
|`ifdef variable` <br/> `ifndef variable` <br/> `ifeq (a,b)` <br/> `ifeq "a" "b"` <br/> `ifeq 'a' 'b'` <br/> `ifneq (a,b)` <br/> `ifneq "a" "b"` <br/> `ifneq 'a' 'b'` <br/> `else` <br/> `endif`|Conditionally evaluate part of the makefile.|
|`include file` <br/> `-include file` <br/> `sinclude file`|Include another makefile.                                    |
|`override variable-assignment`  |Define a variable, overriding any previous definition, even one from the command line. |
|`export`                        |Tell make to export all variables to child processes by default.                       |
|`export variable` <br/> `export variable-assignment` <br/> `unexport variable`|Tell make whether or not to export a particular variable to child processes.|
|`private variable-assignment`   |Do not allow this variable assignment to be inherited by prerequisites.                |
|`vpath pattern path`            |Specify a search path for files matching a '%' pattern.                                |
|`vpath pattern`                 |Remove all search paths previously specified for pattern.                              |
|`vpath`                         |Remove all search paths previously specified in any vpath directive.                   |


## Built-in Functions ##

|Function                              |Description                                                                                                                                        |
|:-------------------------------------|:--------------------------------------------------------------------------------------------------------------------------------------------------|
|`$(subst from,to,text)`               |Replace `from` with `to` in `text`.                                                                                                                |
|`$(patsubst pattern,replacement,text)`|Replace words matching `pattern` with `replacement` in `text`.                                                                                     |
|`$(strip string)`                     |Remove excess whitespace characters from `string`.                                                                                                 |
|`$(findstring find,text)`             |Locate find in `text`.                                                                                                                             |
|`$(filter pattern…,text)`             |Select words in `text` that match one of the `pattern` words.                                                                                      |
|`$(filter-out pattern…,text)`         |Select words in `text` that do not match any of the `pattern` words.                                                                               |
|`$(sort list)`                        |Sort the words in `list` lexicographically, removing duplicates.                                                                                   |
|`$(word n,text)`                      |Extract the `n`-th word (one-origin) of `text`.                                                                                                    |
|`$(words text)`                       |Count the number of words in `text`.                                                                                                               |
|`$(wordlist s,e,text)`                |Returns the list of words in `text` from `s` to `e`.                                                                                               |
|`$(firstword names…)`                 |Extract the first word of `names`.                                                                                                                 |
|`$(lastword names…)`                  |Extract the last word of `names`.                                                                                                                  |
|`$(dir names…)`                       |Extract the directory part of each file name.                                                                                                      |
|`$(notdir names…)`                    |Extract the non-directory part of each file name.                                                                                                  |
|`$(suffix names…)`                    |Extract the suffix (the last '.' and following characters) of each file name.                                                                      |
|`$(basename names…)`                  |Extract the base name (name without suffix) of each file name.                                                                                     |
|`$(addsuffix suffix,names…)`          |Append `suffix` to each word in `names`.                                                                                                           |
|`$(addprefix prefix,names…)`          |Prepend `prefix` to each word in `names`.                                                                                                          |
|`$(join list1,list2)`                 |Join two parallel lists of words.                                                                                                                  |
|`$(wildcard pattern…)`                |Find file names matching a shell file name pattern (_not_ a '%' pattern).                                                                          |
|`$(realpath names…)`                  |For each file name in `names`, expand to an absolute name that does not contain any ., .., nor symlinks.                                           |
|`$(abspath names…)`                   |For each file name in `names`, expand to an absolute name that does not contain any . or .. components, but preserves symlinks.                    |
|`$(error text…)`                      |When this function is evaluated, make generates a fatal error with the message `text`.                                                             |
|`$(warning text…)`                    |When this function is evaluated, make generates a warning with the message `text`.                                                                 |
|`$(shell command)`                    |Execute a shell command and return its output.                                                                                                     |
|`$(origin variable)`                  |Return a string describing how the make variable `variable` was defined.                                                                           |
|`$(flavor variable)`                  |Return a string describing the flavor of the make variable `variable`.                                                                             |
|`$(foreach var,words,text)`           |Evaluate `text` with `var` bound to each word in `words`, and concatenate the results.                                                             |
|`$(if cond,then-part[,else-part])`    |Evaluate `cond`; if it’s non-empty substitute the expansion of the `then-part` otherwise substitute the expansion of the `else-part`.              |
|`$(or cond1[,cond2[,cond3…]])`        |Evaluate `condN` one at a time; substitute the first non-empty expansion. If all expansions are empty, substitute the empty string.                |
|`$(and cond1[,cond2[,cond3…]])`       |Evaluate `condN` one at a time; if any results in empty string substitute the empty string. Otherwise substitute the expansion of the last `condN`.|
|`$(call var,param,…)`                 |Evaluate the variable `var` replacing any references to `$(1)`, `$(2)` with the first, second, etc. param values.                                  |
|`$(eval text)`                        |Evaluate `text` then read the results as makefile commands; expands to the empty string.                                                           |
|`$(file op filename,text)`            |Expand the arguments, then open the file `filename` using mode `op` and write `text` to that file.                                                 |
|`$(value var)`                        |Evaluates to the contents of the variable `var`, with no expansion performed on it.                                                                |


## Automatic Variables ##

|Variable                |Description                                                                  |
|:-----------------------|:----------------------------------------------------------------------------|
|`$@`                    |The file name of the target.                                                 |
|`$%`                    |The target member name, when the target is an archive member.                |
|`$<`                    |The name of the first prerequisite.                                          |
|`$?`                    |The names of all the prerequisites newer than the target, with spaces between them. For prerequisites which are archive members, only the named member is used (see Archives).|
|`$^` <br/> `$+`         |The names of all the prerequisites, with spaces between them. For prerequisites which are archive members, only the named member is used (see Archives). The value of $^ omits duplicate prerequisites, while $+ retains them and preserves their order.|
|`$*`               |The stem with which an implicit rule matches (see How Patterns Match).            |
|`$(@D)` <br/> `$(@F)`   |The directory part and the file-within-directory part of `$@`.               |
|`$(*D)` <br/> `$(*F)`   |The directory part and the file-within-directory part of `$*`.               |
|`$(%D)` <br/> `$(%F)`   |The directory part and the file-within-directory part of `$%`.               |
|`$(<D)` <br/> `$(<F)`   |The directory part and the file-within-directory part of `$<`.               |
|`$(^D)` <br/> `$(^F)`   |The directory part and the file-within-directory part of `$^`.               |
|`$(+D)` <br/> `$(+F)`   |The directory part and the file-within-directory part of `$+`.               |
|`$(?D)` <br/> `$(?F)`   |The directory part and the file-within-directory part of `$?`.               |


## Special Variables ##

|Variables          |Description                                                                                                   |
|:------------------|:-------------------------------------------------------------------------------------------------------------|
|`MAKEFILES`        |Makefiles to be read on every invocation of make.                                                             |
|`VPATH`            |Directory search path for files not found in the current directory.                                           |
|`SHELL`            |The name of the system default command interpreter, usually `/bin/sh`.                                        |
|`MAKESHELL`        |The name of the command interpreter that is to be used by make, taking precedence over `SHELL` (MS-DOS only). |
|`MAKE`             |The name with which make was invoked (using this variable in recipes has special meaning).                    |
|`MAKE_VERSION`     |The built-in variable `MAKE_VERSION` expands to the version number of the GNU make program.                   |
|`MAKE_HOST`        |The built-in variable `MAKE_HOST` expands to a string representing the host that GNU make was built to run on.|
|`MAKELEVEL`        |The number of levels of recursion (sub-makes).                                                                |
|`MAKEFLAGS`        |The flags given to make. You can set this in the environment or a makefile to set flags.  It is _never_ appropriate to use MAKEFLAGS directly in a recipe line: its contents may not be quoted correctly for use in the shell. Always allow recursive make’s to obtain these values through the environment from its parent.|
|`GNUMAKEFLAGS`     |Other flags parsed by make. You can set this in the environment or a makefile to set make command-line flags. GNU make never sets this variable itself. This variable is only needed if you’d like to set GNU make-specific flags in a POSIX-compliant makefile. This variable will be seen by GNU make and ignored by other make implementations. It’s not needed if you only use GNU make; just use MAKEFLAGS directly. See Communicating Options to a Sub-make.|
|`MAKECMDGOALS`     |The targets given to make on the command line. Setting this variable has no effect on the operation of make.  |
|`CURDIR`           |Set to the absolute pathname of the current working directory (after all -C options are processed, if any). Setting this variable has no effect on the operation of make.|
|`SUFFIXES`         |The default list of suffixes before make reads any makefiles.                                                 |
|`.LIBPATTERNS`     |Defines the naming of the libraries make searches for, and their order.                                       |

## Tips ##

Get Makefile root directory:

```
ROOT_DIR:=$(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
```
