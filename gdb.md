# GDB

## Watchpoints

Check they are supported with:

```
gdb$ show can-use-hw-watchpoints
Debugger's willingness to use watchpoint hardware is 1.
```

watch: gdb will break when a write occurs
rwatch: gdb will break when a read occurs
awatch: gdb will break in both cases

```
gdb$ rwatch *0xfeedface
Hardware read watchpoint 2: *0xfeedface
```

Use clear to remove a watchpoint (as breakpoints)


## Expressions

To make gdb print a value after each step:

```
gdb$ display mystruct.myval
```


## Lock thread while stepping

```
set scheduler-locking step
```


## Debug program reading stdin

```sh
gdb /path/to/binary

>>> set args arg1 arg2 < file
>>> run

```
