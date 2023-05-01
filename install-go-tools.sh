#!/bin/bash
set -eu

go install github.com/aclements/go-misc/benchcmd@latest
go install github.com/aclements/go-moremath/cmd/dist@latest
go install github.com/josharian/pct@latest
go install github.com/maruel/panicparse/v2/cmd/pp@latest
go install golang.org/x/perf/cmd/benchstat@latest

# Perflock requires manual installation step
pushd /tmp
git clone https://github.com/aclements/perflock
cd perflock
go build ./cmd/perflock
sudo ./install.bash
cd ..
rm perflock -rf
popd
