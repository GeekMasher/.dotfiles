# If not running interactively, don't do anything (leave this at the top of this file)
[[ $- != *i* ]] && return

# All the default Omarchy aliases and functions
# (don't mess with these directly, just overwrite them here!)
if [[ -f ~/.local/share/omarchy/default/bash/rc ]]; then
    source ~/.local/share/omarchy/default/bash/rc
fi

# Load any environment vars for this particular machine
if [ -f $HOME/.env ]; then
    # export the .env file
    # https://gist.github.com/mihow/9c7f559807069a03e302605691f85572#gistcomment-2706921
    export $(cat $HOME/.env | sed 's/#.*//g' | xargs)
fi

# load all .geek bash files
if [ -d $HOME/.geek ]; then
    for filename in $HOME/.geek/*; do
        source $filename
    done
fi

# Run fastfetch if present on machine
if [ -x "$(command -v fastfetch)" ]; then
    fastfetch
fi
