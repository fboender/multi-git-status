#!/bin/bash

OPTS=
dir="${1:-~/curr-projects}"
cd "$dir"
>&2 echo "Checking $dir"
TIMEFORMAT=%0lR
time mgitstatus --depth=6 -e --no-unnecessary-upstream --no-pull --only-submodules \
    --info -c $OPTS . 2>&1 \
    | stdbuf -o 0 grep -v "Permission denied" \
    | stdbuf -o 0 grep -v "File system loop detected"
#    | grep -v "backups" \
#    | grep -v "sync-root"
