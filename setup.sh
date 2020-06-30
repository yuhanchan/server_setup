#!/usr/bin/env bash

# This script is for ubuntu server setup

set -e

sudo apt update
sudo apt upgrade -y

# essential
sudo apt install -y git vim htop gcc g++ build-essential nasm yasm tar python python3 \
                    python-pip python3-pip zip unzip autoconf automake cmake git-core \
                    libass-dev libfreetype6-dev libgnutls28-dev libsdl2-dev libtool \
                    libva-dev libvdpau-dev libvorbis-dev libxcb1-dev libxcb-shm0-dev \
                    libxcb-xfixes0-dev pkg-config texinfo wget zlib1g-dev

# get zsh
sudo apt install zsh -y

# setup my environment
git clone git@github.com:yuhanchan/dotfiles.git
mv dotfiles/* $HOME/
rm -rf dotfiles/
echo "exec zsh" >> ~/.bashrc

# optional 
sudo apt install docker.io -y

# install pyenv
curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash