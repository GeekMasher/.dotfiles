
## Git

alias gs="git status"
alias gsu="git submodule update --remote --init --recursive --force"

alias clone="git clone --recursive $@"
alias clone-lite="git clone --recursive --depth 1 $@"
alias pull="git pull"
alias push="git push"

alias main="branch main"
alias develop="branch develop"
