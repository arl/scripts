# Git Tips

## Search through git history (with pickaxe: `-S`s)

    git log -SFoo -- path_containing_change

    git log -SFoo --since=2009.1.1 --until=2010.1.1 -- path_containing_change

## Add chunks of a new file

    git add -N $FILE && git add -p $FILE

## Rebase including the root commit

    git rebase -i --root master

## Delete a remote-tracking branch

When a obsolete remote branch doesn't exist anymore upstream

    git branch -rd origin/obsolete-branch

## Mirroring a repository

Create a bare mirrored clone of the repository.

    git clone --mirror https://github.com/exampleuser/repository-to-mirror.git

Set the push location to your mirror.

    cd repository-to-mirror.git
    git remote set-url --push origin https://github.com/exampleuser/mirrored

As with a bare clone, a mirrored clone includes all remote branches and tags,
but all local references will be overwritten each time you fetch, so it will
always be the same as the original repository. Setting the URL for pushes
simplifies pushing to your mirror. To update your mirror, fetch updates and
push.

    git fetch -p origin
    git push --mirror

## Interactive stashing

    git stash save -p

## What Git I do (with git-extras)

    git standup -d 8 -D short

## Advanced blame!

Find commits either adding or removing a string

    git log -c -S'STRING' /path/to/file

If you want the last commit in which STRING existed and you know a commit
in which for sure it was present

    git blame --reverse START_COMMIT.. /path/to/file

## Git-LFS pain in the ass while rebasing

    git lfs uninstall
    git reset --hard # assuming there are no changes to keep!
    git lfs install
    git lfs pull

## Split/Edit commits

    git rebase -i ...
    mark commit(s) to "edit"
    git reset HEAD^ # reset state to the previous commit
    git add         # split into...
    git commit      # ...multiple commits
    git rebase --continue


# Looks for all commits touching a particular file

    git log --follow -- filename

    Add --all across all branches
