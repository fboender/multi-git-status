#!/bin/bash
safe_source () { [[ ! -z ${1:-} ]] && source $1; _dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"; _sdir=$(dirname "$(readlink -f "$0")"); }; safe_source
set -u 
dir="$1"
cd "$dir"
>&2 echo "Checking $dir"
TIMEFORMAT=%0lR
time $_sdir/../mgitstatus --depth=6 -e --no-unnecessary-upstream --no-pull --only-submodules \
    --info -c . 2>&1 \
    | stdbuf -o 0 grep -v "Permission denied" \
    | stdbuf -o 0 grep -v "File system loop detected"
