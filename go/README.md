# GO Tips

## Benchmarks

### Run only one benchmark (and no tests)

```bash
go test -bench MYBENCH -run nope
```

### Generate benchmark comparisons as SVG

Go get the tools:

```bash
go get github.com/ajstarks/svgo/benchviz
go get golang.org/x/tools/cmd/benchcmp
```

Generate two versions of the same benchmarks:

```bash
go test -bench CNQuadtreeCreation -run XXX > old
go test -bench CNQuadtreeCreation -run XXX > new
```

Generate the svg image:

```bash
benchcmp old new | benchviz > out.svg
```

## Debugging with delve

# attach to running process

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
dlv attach $MINIOPID /path/to/myprocess --headless --listen=:2345 --log arg1 arg2
```
