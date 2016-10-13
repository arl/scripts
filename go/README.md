# GO Tips

## Benchmarks

### Only run one benchmark (without any tests)

```bash
go test -bench BenchmarkName -run XXX
```

### Generate a svg benchmark graphic

Get the tools:

```bash
go get github.com/ajstarks/svgo/benchviz
go get golang.org/x/tools/cmd/benchcmp
```

Generate versions to compare:

```bash
go test -bench CNQuadtreeCreation -run XXX > old
go test -bench CNQuadtreeCreation -run XXX > new
```

Finally, generate the svg image:

```bash
benchcmp old new | benchviz > out.svg
```

