FROM docker.io/ubuntu:latest 

WORKDIR /workspace
ENV HOME="/workspace"
ENV ZSH="/workspace/.oh-my-zsh"

ENV TZ=Europe/London
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt-get update && \
    apt-get install -yq \
        curl gnupg git jq zip unzip zsh file locales sudo ca-certificates lsb-release \
        python3 python3-pip python3-venv python3-setuptools \
        libicu-dev \
        stow \
        neofetch && \
    echo "**** clean up ****" && \
    apt-get clean && \
    rm -rf \
        /config/* \
        /tmp/* \
        /var/lib/apt/lists/* \
        /var/tmp/*


RUN sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

RUN chsh -s /bin/zsh

# Install DotFiles
COPY . $HOME/.dotfiles
RUN cd .dotfiles && ./install.sh






