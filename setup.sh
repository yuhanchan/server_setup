#!/usr/bin/env bash

# This script is for ubuntu server setup

set -e

sudo apt update
sudo apt upgrade -y

# install essential pkgs
for pkg in  git vim htop gcc g++ build-essential nasm yasm tar \
            zip unzip autoconf automake cmake git-core \
            libass-dev libfreetype6-dev libgnutls28-dev libsdl2-dev libtool \
            libva-dev libvdpau-dev libvorbis-dev libxcb1-dev libxcb-shm0-dev \
            libxcb-xfixes0-dev pkg-config texinfo wget zlib1g-dev libelf-dev \
            libssl-dev libprotobuf-dev protobuf-compiler \
            python-dev python-setuptools python-smbus libncursesw5-dev \
            libgdbm-dev libc6-dev zlib1g-dev libsqlite3-dev tk-dev \
            openssl libffi-dev libbz2-dev liblzma-dev libreadline-dev; do
    sudo apt install -y $pkg
done

# get zsh
sudo apt install zsh -y

# setup my environment
git clone https://github.com/yuhanchan/dotfiles.git && cp -r -f -v dotfiles/. $HOME/ && rm -rf dotfiles/ && rm $HOME/README.md && rm -rf .git
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
# echo "exec zsh" >> ~/.bashrc

# optional 
sudo apt install docker.io -y

# install pyenv
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
