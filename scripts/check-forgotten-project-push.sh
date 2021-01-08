#!/bin/bash
set -u 
dir="$1"
cd "$dir"
>&2 echo "Checking $dir"
TIMEFORMAT=%0lR
time mgitstatus --depth=5 \
    -e \
    --no-pull \
    --no-unnecessary-upstream \
    --info -c . 2>&1 \
    | stdbuf -o 0 grep -v "Permission denied" \
