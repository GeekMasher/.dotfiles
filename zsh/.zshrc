
# Export different paths
export PATH=$HOME/.geek/bin:$HOME/.local:/usr/local/bin:$PATH

if [[ "$OSTYPE" == "darwin"* ]]; then
    export ZSH=/Users/$USER/.oh-my-zsh
    plugins=(
      1password
      git
      docker
      macos
      shrink-path
      tmux
      python
      rust
      colored-man-pages
      zsh-autosuggestions
    )
else
    export ZSH=$HOME/.oh-my-zsh
    # See https://github.com/ohmyzsh/ohmyzsh/wiki/Plugins
    plugins=(
      1password
      git
      docker
      shrink-path
      tmux
      python
      rust
      debian
      colored-man-pages
      zsh-autosuggestions
    )
fi

export ZSH_CUSTOM=$HOME/.oh-my-zsh/custom
export EDITOR=nvim

# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="geekmasher"

source $ZSH/oh-my-zsh.sh

alias zshconfig="mate $HOME/.zshrc"
alias ohmyzsh="mate $HOME/.oh-my-zsh"

# Load any environment vars for this particular machine
if [ -f $HOME/.env ]; then
    # export the .env file
    # https://gist.github.com/mihow/9c7f559807069a03e302605691f85572#gistcomment-2706921
    export $(cat $HOME/.env | sed 's/#.*//g' | xargs)
fi

# load all .geek bash files
if [ -d $HOME/.geek ]; then
    # See https://github.com/GeekMasher/.dotfiles/tree/main/geek/.geek
    for filename in $HOME/.geek/*; do
        source $filename
    done
fi

# Run neofetch if present on machine
if [ -x "$(command -v fastfetch)" ]; then
    fastfetch
fi

