
export PATH=$HOME/.geek/bin:/usr/local/bin:$PATH
export ZSH=/home/$USER/.oh-my-zsh


# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="blinks"

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

export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3.6

if [ -f '~/.bash_variables' ]; then
    source ~/.bash_variables
fi

# load all .geek bash files
if [ -d ~/.geek ]; then
    for filename in ~/.geek/*; do
        source $filename
    done
fi

