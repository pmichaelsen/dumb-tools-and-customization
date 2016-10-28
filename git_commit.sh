#!/bin/bash

# This is a terrible tool and you should never use this

# author: 
# michaelsenpatrick@gmail.com
# prmichaelsen@git | pmichaelsen@git
#
# description:
# adds, commits, and pushes references across any git repos
# discovered in any current sub directory. repos must have a 
# common branch. They will be committed with the same commit 
# message. will push to origin
#
# run:
# ./git_commit.sh <branch_name> "<commit_message>"
#
# arguments:
# $1: the branch to push
# $2: the commit message

for d in */ ; do
  echo "$d"
  git -C "$d" ls-files --modified | xargs git -C "$d" add
  git -C "$d" commit -m "$1 $2"
  git -C "$d" push origin $1 
done
