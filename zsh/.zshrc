
export PATH=$HOME/.geek/bin:$HOME/.local:/usr/local/bin:$PATH
if [[ "$OSTYPE" == "darwin"* ]]; then
    export ZSH=/Users/$USER/.oh-my-zsh
else
    export ZSH=/home/$USER/.oh-my-zsh
fi

export EDITOR=nvim

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# plugins
plugins=(
  git
  debian
  docker
  mvn
  node
  npm
  pip
  python
  tmux
  kubectl
)

source $ZSH/oh-my-zsh.sh

alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"

# JavaScript
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


if [ -f '~/.env' ]; then
    source ~/.env
fi

# load all .geek bash files
if [ -d ~/.geek ]; then
    for filename in ~/.geek/*; do
        source $filename
    done
fi

[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion


