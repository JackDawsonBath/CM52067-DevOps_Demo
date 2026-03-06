#!/usr/bin/env bash

files=$(git diff --name-only origin/main -- '*.py')

if [ -z "$files" ]; then
	exit 0
fi

grep -Hn "TODO:" $files && exit 1 || exit 0