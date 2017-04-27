# Git Tips

## Search through git history (with pickaxe: `-S`s)


```bash
git log -SFoo -- path_containing_change
```

```bash
git log -SFoo --since=2009.1.1 --until=2010.1.1 -- path_containing_change
```
