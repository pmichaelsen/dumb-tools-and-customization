#!/bin/bash

# outputs names of all files
# with delta between current branch
# compared to origin/master
# across any git repos
# found in any current subdir

for d in */ ; do
  echo "$d"
  git -C "$d" diff --name-status origin/master
done
