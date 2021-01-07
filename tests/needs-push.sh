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
