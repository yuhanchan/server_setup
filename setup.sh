#!/usr/bin/env bash

RED='\033[0;31m'
GREEN='\033[0;32m'
CYAN='\033[0;36m'
NC='\033[0m'

# This script is for ubuntu server setup

set -e

while true; do
    echo -en "${CYAN}Step1: System update and upgrade? [y/n] $NC"
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
    echo -en "${CYAN}Step2: Install essential packages? [y/n] $NC"
    read -n 1 choice
    case $choice in 
        y)
            echo -e "\n"
            sudo apt install htop git vim gcc g++ build-essential tar zip unzip gawk ripgrep \
                             autoconf automake cmake git-core nasm yasm tree curl xsel -y
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
    echo -en "${CYAN}Step3: Install optional packages? [y/n] $NC"
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
    echo -en "${CYAN}Step4: Install zsh and oh-my-zsh? [y/n] $NC"
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
    echo -en "${CYAN}Step5: Install neovim? [y/n] $NC"
    read -n 1 choice
    case $choice in 
        y)
            echo -e "\n"
            # apt version is usually old
            wget https://github.com/neovim/neovim/releases/download/v0.7.0/nvim-linux64.deb
            sudo dpkg -i nvim-linux64.deb
            rm nvim-linux64.deb

            # install Packer
            git clone --depth 1 https://github.com/wbthomason/packer.nvim\
            $HOME/.local/share/nvim/site/pack/packer/start/packer.nvim
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
    echo -en "${CYAN}Step6: Install tmux? [y/n] $NC"
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
    echo -en "${CYAN}Step7: [Optional] Install docker? [y/n] $NC"
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


while true; do
    echo -en "${CYAN}Step8: Install nodejs? This is needed if you want to use copilot in neovim [y/n] $NC"
    read -n 1 choice
    case $choice in 
        y)
            echo -e "\n"
            mkdir -p $HOME/local
            pushd $HOME/local
            wget https://nodejs.org/dist/v16.14.2/node-v16.14.2-linux-x64.tar.xz
            tar -xvf node-v16.14.2-linux-x64.tar.xz
            rm node-v16.14.2-linux-x64.tar.xz
            echo -e "${GREEN}nodejs 16 and npm installed, add $HOME/local/node-v16.14.2-linux-x64/bin to your PATH $NC"
            popd
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
    echo -en "${CYAN}Step9: Install lazygit? [y/n] $NC"
    read -n 1 choice
    case $choice in 
        y)
            echo -e "\n"
            sudo add-apt-repository ppa:lazygit-team/release
            sudo apt-get update
            sudo apt-get install lazygit
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
    echo -en "${CYAN}Step10: Install Hack fonts? [y/n] $NC"
    read -n 1 choice
    case $choice in 
        y)
            echo -e "\n"
            mkdir -p $HOME/.fonts
            pushd $HOME/.fonts 
            wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Hack.zip
            unzip Hack.zip
            rm Hack.zip
            fc-cache -fv
            popd
            echo -e "\n${CYAN}Nerd Font installed, you may need to change font settings in terminal and vscode to use it.${NC}"
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
    echo -en "${CYAN}Step11: Clone my dotfiles from github? [y/n] $NC"
    read -n 1 choice
    case $choice in 
        y)
            echo -e "\n"
            if [ -d $HOME/.dotfiles ]
            then
                while true; do
                    echo -e "${CYAN}$HOME/.dotfiles folder exists, do you want to remove it and clone a new one? [y/n] $NC"
                    read -n 1 a
                    case $a in
                        y)
                            echo -e "\n"
                            echo -e "${CYAN}Removing $HOME/.dotfiles...$NC"
                            rm -rf $HOME/.dotfiles
                            echo -e "${CYAN}Cloning $HOME/.dotfiles...$NC"
                            git clone https://github.com/yuhanchan/dotfiles.git $HOME/.dotfiles
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
            else
                echo -e "${CYAN}$HOME/.dotfiles not exists, cloning... $NC"
                git clone https://github.com/yuhanchan/dotfiles.git $HOME/.dotfiles
            fi

            echo -en "${CYAN}Calling dotbot to install dotfiles[y/n] $NC"
            pushd $HOME/.dotfiles
            ./install
            popd
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
    echo -en "${CYAN}Step12: Install conda? [y/n] $NC"
    read -n 1 choice
    case $choice in 
        y)
            echo -e "\n"
            mkdir -p $HOME/local
            wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
            bash Miniconda3-latest-Linux-x86_64.sh -p $HOME/local/miniconda3
            rm Miniconda3-latest-Linux-x86_64.sh
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
    echo -en "${CYAN}Step13: Install pyenv? You should pick either conda or pyenv. [y/n] $NC"
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
    echo -en "${CYAN}Step14: Install fzf? [y/n] $NC"
    read -n 1 choice
    case $choice in 
        y)
            echo -e "\n"
            git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf
            ~/.fzf/install
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
    echo -en "${CYAN}Step15: [Optional] Install go? [y/n] $NC"
    read -n 1 choice
    case $choice in 
        y)
            echo -e "\n"
            mkdir -p $HOME/local/go
            pushd $HOME/local
            wget https://go.dev/dl/go1.18.1.linux-amd64.tar.gz
            rm -rf $HOME/local/go 
            tar -xzf go1.18.1.linux-amd64.tar.gz
            rm go1.18.1.linux-amd64.tar.gz
            popd
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
    echo -en "${CYAN}Step16: [Optional] Install glow, for markdown preview in nvim? (require go installed) [y/n] $NC"
    read -n 1 choice
    case $choice in 
        y)
            echo -e "\n"
            mkdir -p $HOME/local
            pushd $HOME/local
            git clone https://github.com/charmbracelet/glow.git
            cd glow
            go build
            popd
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
