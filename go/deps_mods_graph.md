# Print a PNG graph of all packages dependencies
gomod graph -p | dot -Tpng > deps.png
