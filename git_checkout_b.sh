#!/bin/bash
for d in */ ; do
  echo "$d"
  git -C "$d" checkout -b "$1"
done
