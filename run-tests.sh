#!/bin/bash
check(){
    local got="$1"
    local expected="$2"
    if [[ "$got" != "$expected" ]]; then
        echo "-> Expected:"
        echo "$expected"
        echo "-> Got:"
        echo "$got"
        exit 1
    fi  
}

cwd=$PWD
TESTS_DIR="$cwd/tests/__tmp__"
[[ -d "$TESTS_DIR" ]] && rm -rf "$TESTS_DIR"
bin="$PWD/mgitstatus"
export bin
export TESTS_DIR
export -f check
out=$(mktemp)

echo "Running tests:"
echo "--------------"
for test in $cwd/tests/*; do
    mkdir "$TESTS_DIR"
    cd "$TESTS_DIR"
    if $test > $out 2>&1; then
        echo "Passed: $(basename $test)"
        rm -rf "$TESTS_DIR" 2> /dev/null
    else
        echo "Failed in $(basename $test)" 
        cat $out
        rm $out
        exit 1
    fi
done
rm $out
