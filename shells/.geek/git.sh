
## Git

function git.ignore() {
    # This function creates a `.gitignore` file using gitignore.io
    if [ $# -eq 0 ]; then
        echo "No arguments supplied"
    else
        echo "Using gitignore.io ..."
        LANGS=$@
        curl -L -s https://www.gitignore.io/api/${LANGS// /,} > ./.gitignore
    fi
}
