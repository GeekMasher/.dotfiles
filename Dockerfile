FROM debian:testing

ENV USER=geekmasher
ENV CONTAINER=true
ENV TZ=Europe/London

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install all the things
RUN apt-get update -y
RUN DEBIAN_FRONTEND=noninteractive \
    apt-get install -y curl git gh jq wget sudo stow zip zsh neofetch tmux \
        python3 python3-pip python3-venv \
        build-essential libssl-dev ca-certificates pkg-config \
        fuse libfuse2

# Clean up
RUN apt-get autoremove -y && \
    apt-get clean autoclean -y && \
    rm -rf /var/lib/{apt,dpkg,cache,log}/


# Create User
RUN useradd -s /bin/bash -m ${USER} 
RUN chsh -s $(which zsh) ${USER} 

# Switch Users
USER ${USER} 

WORKDIR /home/${USER}
COPY . .dotfiles

# ZSH
RUN sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
RUN git clone --depth=1 https://github.com/zsh-users/zsh-autosuggestions ~/.oh-my-zsh/custom/plugins/zsh-autosuggestions 

# Rust / Cargo (nightly)
ENV PATH="/home/${USER}/.cargo/bin:${PATH}"
RUN curl https://sh.rustup.rs -sSf | bash -s -- --default-toolchain nightly -y && \
    cargo install cargo-watch cargo-generate cargo-audit

# Python 
# RUN pip3 install pipenv

# Install Dotfiles
RUN cd .dotfiles && touch ~/.env && rm ~/.zshrc && \
    ./install.sh

# Install Neovim
RUN ~/.local/update-nvim

