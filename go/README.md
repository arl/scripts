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

