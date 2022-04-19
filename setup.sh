#!/usr/bin/env bash

RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
NC='\033[0m'

# This script is for ubuntu server setup

set -e

while true; do
    echo -n "Step1: System update and upgrade? [y/n] "
    read -n 1 choice
    case $choice in 
        y)
            echo -e "\n"
            sudo apt update
            sudo apt upgrade -y
            break
            ;;
        n)
            echo -e "\n"
            break
            ;;
        *)
            echo -e "\nPlease type [y/n]"
            ;;
    esac
done
      

while true; do
    echo -n "Step2: Install essential packages? [y/n] "
    read -n 1 choice
    case $choice in 
        y)
            echo -e "\n"
            sudo apt install htop git vim gcc g++ build-essential tar zip unzip \
                             autoconf automake cmake git-core nasm yasm -y
            break
            ;;
        n)
            echo -e "\n"
            break
            ;;
        *)
            echo -e "\nPlease type [y/n]"
            ;;
    esac
done


while true; do
    echo -n "Step3: Install optional packages? [y/n] "
    read -n 1 choice
    case $choice in 
        y)
            echo -e "\n"
            sudo apt install libass-dev libfreetype6-dev libgnutls28-dev libsdl2-dev libtool \
                             libva-dev libvdpau-dev libvorbis-dev libxcb1-dev libxcb-shm0-dev \
                             libxcb-xfixes0-dev pkg-config texinfo wget zlib1g-dev libelf-dev \
                             libssl-dev libprotobuf-dev protobuf-compiler \
                             python-dev python-setuptools libncursesw5-dev \
                             libgdbm-dev libc6-dev zlib1g-dev libsqlite3-dev tk-dev \
                             openssl libffi-dev libbz2-dev liblzma-dev libreadline-dev -y
            break
            ;;
        n)
            echo -e "\n"
            break
            ;;
        *)
            echo -e "\nPlease type [y/n]"
            ;;
    esac
done


while true; do
    echo -n "Step4: Install zsh and oh-my-zsh? [y/n] "
    read -n 1 choice
    case $choice in 
        y)
            echo -e "\n"
            sudo apt install zsh -y
            sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
            git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
            git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
            break
            ;;
        n)
            echo -e "\n"
            break
            ;;
        *)
            echo -e "\nPlease type [y/n]"
            ;;
    esac
done


while true; do
    echo -n "Step5: Install neovim? [y/n] "
    read -n 1 choice
    case $choice in 
        y)
            echo -e "\n"
            sudo apt install neovim -y
            break
            ;;
        n)
            echo -e "\n"
            break
            ;;
        *)
            echo -e "\nPlease type [y/n]"
            ;;
    esac
done


while true; do
    echo -n "Step6: Install tmux? [y/n] "
    read -n 1 choice
    case $choice in 
        y)
            echo -e "\n"
            sudo apt install tmux -y
            break
            ;;
        n)
            echo -e "\n"
            break
            ;;
        *)
            echo -e "\nPlease type [y/n]"
            ;;
    esac
done


while true; do
    echo -n "Step7: Install conda? [y/n] "
    read -n 1 choice
    case $choice in 
        y)
            echo -e "\n"
            wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
            bash Miniconda3-latest-Linux-x86_64.sh
            break
            ;;
        n)
            echo -e "\n"
            break
            ;;
        *)
            echo -e "\nPlease type [y/n]"
            ;;
    esac
done


while true; do
    echo -n "Step8: Install pyenv? You should pick either conda or pyenv. [y/n] "
    read -n 1 choice
    case $choice in 
        y)
            echo -e "\n"
            curl -L https://github.com/pyenv/pyenv-installer/raw/master/bin/pyenv-installer | bash
            break
            ;;
        n)
            echo -e "\n"
            break
            ;;
        *)
            echo -e "\nPlease type [y/n]"
            ;;
    esac
done


while true; do
    echo -n "Step9: [Optional] Install docker? [y/n] "
    read -n 1 choice
    case $choice in 
        y)
            echo -e "\n"
            sudo apt install docker.io -y
            break
            ;;
        n)
            echo -e "\n"
            break
            ;;
        *)
            echo -e "\nPlease type [y/n]"
            ;;
    esac
done


echo -e "\n${GREEN}Setup Script finished${NC}"

# # setup my environment
# git clone --recurse-submodules https://github.com/yuhanchan/dotfiles.git $HOME/Misc/dotfiles
# rm -rf $HOME/.dotfiles $HOME/.commonrc $HOME/.bashrc $HOME/.zshrc $HOME/.vimrc $HOME/.vim $HOME/.tmux.conf $HOME/.tmux
# ln -s $HOME/Misc/dotfiles/.dotfiles $HOME/.dotfiles 
# ln -s $HOME/Misc/dotfiles/.commonrc $HOME/.commonrc
# ln -s $HOME/Misc/dotfiles/.bashrc $HOME/.bashrc
# ln -s $HOME/Misc/dotfiles/.zshrc $HOME/.zshrc
# ln -s $HOME/Misc/dotfiles/.vimrc $HOME/.vimrc
# ln -s $HOME/Misc/dotfiles/.vim $HOME/.vim
# ln -s $HOME/Misc/dotfiles/.tmux.conf $HOME/.tmux.conf
# ln -s $HOME/Misc/dotfiles/.tmux $HOME/.tmux
