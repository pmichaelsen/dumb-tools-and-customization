#!/bin/bash

# This is a terrible tool and you should never use this

# author: 
# michaelsenpatrick@gmail.com
# prmichaelsen@git | pmichaelsen@git
#
# description:
# git status multiple repos
#
# run:
# ./git_status.sh <repo_name>[1...*] 
#
# arguments:
# repo_name: one or more space deliminated repos 

echo "Commands to run"
echo "***************"

for i in $(seq 1 $(($#))) ; do
	d="./${!i}"
	echo
	echo "$d"
  echo git -C "$d" status 
done

read -r -p "Are you sure you wish to run the above commands? [y/N] " response
case $response in
	[yY][eE][sS]|[yY]) 
		for i in $(seq 1 $(($#))) ; do
			echo
			d="./${!i}"
			echo "$d"
			git -C "$d" status
		done
		;;
	*)
		;;
esac
