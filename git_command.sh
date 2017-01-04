#!/bin/bash

# This is a terrible tool and you should never use this

# author: 
# michaelsenpatrick@gmail.com
# prmichaelsen@git | pmichaelsen@git
#
# description:
# updates <branch> if a remote upstream exists
#
# run:
# ./git_command.sh <branch> <repo_name>[1...*] 
#
# arguments:
# branch: the branch to update
# repo_name: one or more space deliminated repos to commit 

echo "Commands to run"
echo "***************"

for i in $(seq 2 $(($#))) ; do
	d="./${!i}"
	echo
	echo "$d"
  echo git -C "$d" fetch upstream 
  echo git -C "$d" merge upstream/$1 
done

read -r -p "Are you sure you wish to run the above commands? [y/N] " response
case $response in
	[yY][eE][sS]|[yY]) 
		for i in $(seq 2 $(($#))) ; do
			echo
			d="./${!i}"
			echo "$d"
			git -C "$d" fetch upstream 
			git -C "$d" merge upstream/$1 
		done
		;;
	*)
		;;
esac
