#!/bin/bash

# This is a terrible tool and you should never use this

# author: 
# michaelsenpatrick@gmail.com
# prmichaelsen@git | pmichaelsen@git
#
# description:
# adds, commits, and pushes references across many git repos
# at once. repos must have a common branch. They will be
# committed with the same commit message. will push to origin
#
# run:
# ./git_commit_by_name.sh <repo_name>[1...*] <branch_name> "<commit_message>"
#
# arguments:
# repo_name: one or more space deliminated repos to commit 
# branch_name: the branch to push
# commit_message: the commit message

echo "Commands to run"
echo "***************"

branch=$(($#-1))
message=$(($#))
for i in $(seq 1 $(($#-2))) ; do
	d="./${!i}"
	echo
	echo "$d"
	echo git -C "$d" add .
	echo git -C "$d" commit -m "\"${!branch} ${!message}\""
	echo git -C "$d" push origin ${!branch} 
done

read -r -p "Are you sure you wish to run the above commands? [y/N] " response
case $response in
	[yY][eE][sS]|[yY]) 
		for i in $(seq 1 $(($#-2))) ; do
			echo
			d="./${!i}"
			echo "$d"
			git -C "$d" add .
			git -C "$d" commit -m "${!branch} ${!message}"
			git -C "$d" push origin ${!branch} 
		done
		;;
	*)
		;;
esac
