
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

# Load any environment vars for this particular machine
if [ -f ~/.env ]; then
    source ~/.env
fi

# load all .geek bash files
if [ -d ~/.geek ]; then
    for filename in ~/.geek/*; do
        source $filename
    done
fi

# Run neofetch if present on machine
if [ -x "$(command -v neofetch)" ]; then
    neofetch
fi
