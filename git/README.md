# Git Tips

## Search through git history (with pickaxe: `-S`s)

```bash
git log -SFoo -- path_containing_change
```

```bash
git log -SFoo --since=2009.1.1 --until=2010.1.1 -- path_containing_change
```

## Add chunks of a new file

```bash
git add -N $FILE && git add -p $FILE
```

## Mirroring a repository

Create a bare mirrored clone of the repository.

```bash
git clone --mirror https://github.com/exampleuser/repository-to-mirror.git
```

Set the push location to your mirror.

```bash
cd repository-to-mirror.git
git remote set-url --push origin https://github.com/exampleuser/mirrored
```

As with a bare clone, a mirrored clone includes all remote branches and tags,
but all local references will be overwritten each time you fetch, so it will
always be the same as the original repository. Setting the URL for pushes
simplifies pushing to your mirror. To update your mirror, fetch updates and
push.

```bash
git fetch -p origin
git push --mirror
```
