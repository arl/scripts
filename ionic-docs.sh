#! /bin/bash
. libcli.sh

cd /home/panty/Documents/dev/ionic-site > /dev/null

echo
echo
echo '-------------------------------------------------'
echo '- starting ionic framework documentation server -'
echo '-------------------------------------------------'
echo

# launch jekyll, redirecting standard output & error to null
2>/dev/null 1>/dev/null jekyll serve -w & > /dev/null
JEKYLL_PID=$!

sleep 10

echo '   starting google-chrome at http://127.0.0.1:4000/'
# launch chrome, redirecting standard output & error to null
2>/dev/null 1>/dev/null google-chrome http://127.0.0.1:4000/ &

echo
echo 'press k to stop serving ionic framework documentation'
echo
waitforkey k

kill $JEKYLL_PID

