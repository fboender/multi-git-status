(
    mkdir -p a/b
    git init foo > /dev/null
    cd a
    git init bar > /dev/null
    cd b
    git init baz > /dev/null
)

check "`$bin --depth=0 .`" "`cat << EOL
./a/b/baz: Repo has no commits yet
./a/bar: Repo has no commits yet
./foo: Repo has no commits yet
EOL
`" || break
