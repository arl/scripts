# watchpoints

Check they are supported with:

```
gdb$ show can-use-hw-watchpoints
Debugger's willingness to use watchpoint hardware is 1.
```

watch: gdb will break when a write occurs
rwatch: gdb will break wnen a read occurs
awatch: gdb will break in both cases

```
gdb$ rwatch *0xfeedface
Hardware read watchpoint 2: *0xfeedface
```

Use clear to remove a watchpoint (as breakpoints)


# expressions

To make gdb print a value after each step:

```
gdb$ display mystruct.myval
```

