#!/usr/bin/env bash

# Set BASE and HEAD from Github environment variables, with fallback for local/non-git tests
BASE=${GITHUB_BASE_SHA}
HEAD=${GITHUB_SHA}

files=$(git diff --name-only "$BASE" "$HEAD" -- '*.py')

if [ -z "$files" ]; then
	exit 0
fi

todo_found=0

for f in $files; do
	matches=$(grep -Hn "TODO:" $f)
	if [ -n  "matches" ]; then
		echo "$matches"
		todo_found=1
	fi

done

if [ $todo_found -eq 1 ]; then
	echo "Some changed files contain TODOs. Please review."
	exit 1
else
	exit 0
fi