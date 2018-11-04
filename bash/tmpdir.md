```bash
MYTMPDIR=$(mktemp -d)
trap "rm -rf $MYTMPDIR" EXIT
```
