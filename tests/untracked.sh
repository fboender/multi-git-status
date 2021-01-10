(
    git init a
    cd a
    echo "hello" > file
    git add . 
    git commit -m "first commit"
    echo "there" > file2
)

check "`$bin --depth=0 a`" "`cat << EOL
a: Needs upstream (master) Untracked files 
EOL
`"
