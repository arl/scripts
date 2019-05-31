# Debugging with delve

## attach to running process

Build without optimizations:

```sh
go install -gcflags '-N -l'
```

Run the process and get its PID:
```sh
myprocess
MYPID=$(pgrep myprocess)
```

Attach the debugger:
```sh
dlv attach $MYPID /path/to/myprocess --headless --listen=:2345 --log arg1 arg2
```
