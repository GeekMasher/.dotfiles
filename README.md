# My Little Box Of Linux Tricks

This is a list of scripts, tricks and help docs on my Linux adventures.

## Installing

*Download and install in one:*
```bash
git clone https://github.com/GeekMasher/MyLittleBoxOfLinuxTricks.git; cd MyLittleBoxOfLinuxTricks; ./install.sh
```

## Lazy Scripts:

### Bash

I have both a `.bashrc` file here used to store configuration settings for Bash and a `.bash_aliases` file.
This other file is used to store all my different aliases because I'm a lazy man.

### ZSH

```bash
./install.sh zsh
```

### Vim

I have both my `.vimrc` file used to configure Vim and the `.vim` folder.
This is used to store over Vim based files such as Vundle bundles and different editor schema colours.

```bash
./install.sh vim
```

### Docker

This is a simpel script that follows the exact commands you would run if you follow the [Docker-CE install guide](https://docs.docker.com/install/linux/docker-ce/ubuntu/).

```bash
./install.sh docker
```

### Developer

This install some of my favorite text editors:

- Vim
- VSCode
- PyCharm

```bash
./install.sh vim code pycharm
```

You can install some of my favorite languages:

- Python
- JavaScript

```bash
./install.sh python javascript
```

## Contributing

Please help me add, improve and correct any problems you find in this repository.
