# list all commits in reflog that touch a specific file
git rev-list --all -- foo.html | xargs git show --name-status --oneline

