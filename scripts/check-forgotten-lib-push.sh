#!/bin/bash
set -u 
dir="$1"
cd "$dir"
>&2 echo "Checking $dir"
TIMEFORMAT=%0lR
time mgitstatus --depth=6 -e --no-unnecessary-upstream --no-pull --only-submodules \
    --info -c . 2>&1 \
    | stdbuf -o 0 grep -v "Permission denied" \
    | stdbuf -o 0 grep -v "File system loop detected"
