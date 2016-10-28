#!/bin/bash
for d in */ ; do
  echo "$d"
  git -C "$d" checkout "$1"
done
