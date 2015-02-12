#! /bin/bash

# array declaration
sequence=( a b c "de" 1 3)

# array loop
((n_elements=${#sequence[@]}, max_index=n_elements - 1))

for ((i = 0; i <= max_index; i++)); do
  echo "Element $i: '${sequence[i]}'"
done

# more good examples at http://wiki.bash-hackers.org/start 
