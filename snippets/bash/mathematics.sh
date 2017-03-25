#! /usr/bin/env bash

echo "                 '~ ~ ~'"
echo "       Super simple example of \`bc\`"
echo "                 '~ ~ ~'"
echo

a=2.2
b=3.14

echo "$a > $b?"
echo $a'>'$b | bc
echo
echo "$a < $b?"
echo $a'<'$b | bc
echo
echo 1/0
echo 1/0 | bc
echo
echo 1/2
echo 1/2 | bc
echo
echo 1/2 with -l option
echo 1/2 | bc -l
echo
echo Example: test tmux version is >= 2.0
tmux_version=$(tmux -V | cut -d ' ' -f2)
echo tmux_version is $tmux_version
if [ $(echo $tmux_version'>='2.0 | bc) -eq 1 ]; then
  echo -ne "$tmux_version is >= 2.0;\t"
fi
if [ $(echo $tmux_version'<'3.0 | bc) -eq 1 ]; then
  echo "$tmux_version is < 3.0"
fi

# one liner
if [ `echo $(tmux -V | cut -d ' ' -f2)'>=2.0' | bc` -eq 1 ]; then
	echo 'tmux >= 2.0'
else
	echo 'tmux < 2.0'
fi
