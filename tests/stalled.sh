(
    git init a
    cd a
    echo "hello" > file
    git add . 
    git commit -m "first commit"
    cd ..
    git clone a x 
    cd x 
    git checkout -b "second"
    echo "there" > file
    git add . 
    git commit -m "second commit"
) > /dev/null

check "`$bin --depth=0 x`" "`cat << EOL
x: Needs upstream (second) 
EOL
`" || break

# If some other branch has commits that current branch hasn't, 
# then the other branch is accepted as "stalled"
(
    cd x 
    git checkout master
)

check "`$bin --depth=0 x`" "`cat << EOL
x: Needs upstream (second) 1 stalled (second) 
EOL
`" || break

