#!/bin/bash
dump(){
    echo "expected:"
    echo "${1}"
    echo "got:"
    echo "${2}"
}

check(){
    local got="$1"
    local expected="$2"
    if [[ "$got" != "$expected" ]]; then
        echo "FAILED in $(basename $test):" 
        echo "-> Expected: "
        echo "$expected"
        echo "-> Got:"
        echo "$got"
        return 1
    else
        return 0
    fi
   
}

cwd=$PWD
TESTS_DIR="$cwd/tests/__tmp__"
rm -rf "$TESTS_DIR" 2> /dev/null
bin="$PWD/mgitstatus"
export bin
export TESTS_DIR
for test in $cwd/tests/*; do
    mkdir "$TESTS_DIR"
    cd "$TESTS_DIR"
    . $test
    echo "Passed: $(basename $test)"
    rm -rf "$TESTS_DIR" 2> /dev/null
done