# Go Performance

## Benchmarks

### Avoid noise on the testing machine

Close ALL browser tabs, music, Slack, etc.

Lock performance on the benchmark process
So you get equal result over time and no CPU throtling.

Install https://github.com/aclements/perlock

    perflock -daemon &
    perflock -governor=70% go test -bench ...


### Compare benchmarks

Install https://golang.org/x/perf/cmd/benchstat

    benchstat bench.1 bench.2 [bench.n, ...]


### Generate benchmark comparisons as SVG

Install http://github.com/ajstarks/svgo/benchviz
Install http://golang.org/x/tools/cmd/benchcmp

Generate two versions of the same benchmarks:

```sh
go test -bench BenchmarkStuff -run ^$ > old
go test -bench BenchmarkStuff -run ^$ > new
```

Generate the svg image:

```sh
benchcmp old new | benchviz > out.svg
```

## Tools

### Inlining

    go build -gcflags='-m -m' ... |& grep 'cannot inline'

### Escape analysis

    go build -gcflags='-m -m' ... |& grep 'escapes to heap'

### Bound-check eliminitation (BCE)

List bound checks:

    go build -gcflags='-d=ssa/check_bce/debug=1' ...

Build a binary/package without bound-checks:

    go build "-gcflags=[pkg=]-B"

### Binary size

Install https://github.com/loov/goda

    goda weight <binary>
    goda weight-diff <binary1> <binary2>

### Assembly level

Install https://github.com/loov/ixdiff
