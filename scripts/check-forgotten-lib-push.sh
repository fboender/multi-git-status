#!/bin/bash
# Author: ceremcem
# Description: Specifically checks the unpushed library type projects.

OPTS=
PROJ_DIR="$1"
[[ -d "$PROJ_DIR" ]] || { echo "Usage: $(basename $0) path/to/projects/folder"; exit 1; }
cd "$PROJ_DIR"
TIMEFORMAT=%0lR
time mgitstatus --depth=6 -e --no-upstream --no-pull --only-submodules \
    --info -c $OPTS . 2>&1 \
    | stdbuf -o 0 grep -v "Permission denied" \
    | stdbuf -o 0 grep -v "File system loop detected"
