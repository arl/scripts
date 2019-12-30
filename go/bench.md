# Go Benchmarks

## Avoid noise on the testing machine

Close ALL browser tabs, music, Slack, etc.

Lock performance on the benchmark process
So you get equal result over time and no CPU throtling.

    go get github.com/aclements/perlock
    perflock -daemon &
    perflock -governor=70% go test -bench ...


## Compare benchmark

    benchstat


## Generate benchmark comparisons as SVG

    github.com/ajstarks/svgo/benchviz
    golang.org/x/tools/cmd/benchcmp

Generate two versions of the same benchmarks:

```sh
go test -bench BenchmarkStuff -run ^$ > old
go test -bench BenchmarkStuff -run ^$ > new
```

Generate the svg image:

```sh
benchcmp old new | benchviz > out.svg
```

## Inlining

    go build -gcflags='-m -m' ... | grep 'function too complex'

## Escape analysis

    go build -gcflags='-m -m' ... | grep 'escapes to heap'

## Bounds checking elimination

    go build -gcflags='-d=ssa/check_bce/debug=1' ...
