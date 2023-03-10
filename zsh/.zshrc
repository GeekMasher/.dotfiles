
export PATH=$HOME/.geek/bin:$HOME/.local:/usr/local/bin:$PATH
if [[ "$OSTYPE" == "darwin"* ]]; then
    export ZSH=/Users/$USER/.oh-my-zsh
else
    export ZSH=/home/$USER/.oh-my-zsh
fi

export ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
export EDITOR=nvim

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="geekmasher"

# See https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins
plugins=(
  git
  docker
  kubectl
  tmux
  python
  rust
  debian
  macos
  colored-man-pages
  zsh-autosuggestions
)

source $ZSH/oh-my-zsh.sh

alias zshconfig="mate ~/.zshrc"
alias ohmyzsh="mate ~/.oh-my-zsh"

# Load any environment vars for this particular machine
if [ -f ~/.env ]; then
    # export the .env file
    # https://gist.github.com/mihow/9c7f559807069a03e302605691f85572#gistcomment-2706921
    export $(cat ~/.env | sed 's/#.*//g' | xargs)
fi

# load all .geek bash files
if [ -d ~/.geek ]; then
    # See https://github.com/GeekMasher/.dotfiles/tree/main/geek/.geek
    for filename in ~/.geek/*; do
        source $filename
    done
fi

# Run neofetch if present on machine
if [ ! -z ${NEOFETCH+x} ] && [ -x "$(command -v neofetch)" ]; then
    neofetch
fi

