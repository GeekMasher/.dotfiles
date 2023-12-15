
## Git

alias clone="git clone --recursive $@"
alias clone-lite="git clone --recursive --depth 1 $@"
alias status="git status"

# Change branch or create new branch
function branch() {
    if git rev-parse --verify --quiet refs/heads/$1; then
        git checkout $1
        git pull origin $1
    else
        git checkout -b $1
    fi
}

alias main="branch main"
alias develop="branch develop"

