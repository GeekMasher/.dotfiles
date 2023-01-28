
## Git

alias clone="git clone --recursive $@"
alias branch="git checkout -b $@"
alias status="git status"

function worktree() {
    echo "Enabling git worktree..."
    alias clone="git clone --bare $@"
    alias branch="git worktree add $@"
}


alias gitp="git push"
alias gitc="git commit"
alias gita="git add $@"

alias main="git checkout main"
alias develop="git checkout develop"

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
