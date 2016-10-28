#!/bin/bash
for d in */ ; do
  echo "$d"
  git -C "$d" diff 
done
