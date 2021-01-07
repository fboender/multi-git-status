(
    git init a
    cd a
    echo "hello" > file
    git add . 
    git commit -m "first commit"
    cd ..
    git clone a x 
    cd x 
    echo "there" > file
    git add . 
    git commit -m "second commit"
) > /dev/null

check "`$bin --depth=0 x`" "`cat << EOL
x: Needs push (master) 
EOL
`" || break

(
    cd x
    git checkout -b some-branch
)

check "`$bin --depth=0 x`" "`cat << EOL
x: Needs push (master) Needs upstream (some-branch) 
EOL
`" || break

check "`$bin --depth=0 --no-unnecessary-upstream x`" "`cat << EOL
x: Needs push (master) Needs upstream (some-branch) 
EOL
`" || break

(
    cd x
    git checkout master
)

# some-branch has no unique commits, so it doesn't really need an upstream
check "`$bin --depth=0 --no-unnecessary-upstream x`" "`cat << EOL
x: Needs push (master) 
EOL
`" || break
