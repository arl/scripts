#! /bin/bash

DIR=$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )

pushd . > /dev/null
cd $DIR

echo "SNIPPETS CATEGORIES"
echo 
echo -e "-(0)\tall"
declare -a categories
let idxcat=1
for cat in `ls -d */`;
do
	cat=${cat%%/}
	echo -e "-($idxcat)\t$cat"
	let "idxcat++"
done


echo TO BE CONTINUED HERE!!!
exit

while read -r -n 1 -s answer; do
  if [[ $answer = [${choices[0]}${choices[1]}] ]]; then
	[[ $answer = [${choices[0]}] ]] && retval=0
	[[ $answer = [${choices[1]}] ]] && retval=1
	break
  fi
done



echo -e "-(Q)\tquit"
#Yp 	do if [ -d "$subdir" ]; then mv "$subdir" "backup/$subdir"; mv "targetDir/$subdir" "$subdir"; echo "$subdir"; fi; done
popd > /dev/null
