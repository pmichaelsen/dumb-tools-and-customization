#!/bin/bash

# outputs status of all git repos
# found in any current subdir

for d in */ ; do
  echo "$d"
  git -C "$d" status 
done
