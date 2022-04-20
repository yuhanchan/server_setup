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
            sudo apt install htop git vim gcc g++ build-essential tar zip unzip \
                             autoconf automake cmake git-core nasm yasm tree curl -y
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
    echo -en "${CYAN}Step7: Install conda? [y/n] $NC"
    read -n 1 choice
    case $choice in 
        y)
            echo -e "\n"
            wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
            bash Miniconda3-latest-Linux-x86_64.sh
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
    echo -en "${CYAN}Step8: Install pyenv? You should pick either conda or pyenv. [y/n] $NC"
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
    echo -en "${CYAN}Step9: [Optional] Install docker? [y/n] $NC"
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
    echo -en "${CYAN}Step10: Setup neovim env? [y/n] $NC"
    read -n 1 choice
    case $choice in 
        y)
            echo -e "\n"
            # ftplugin: for different language indentation rule files
            # lint: for different language linting files
            # snippet: for code snippet
            mkdir -p $HOME/.config/nvim/{ftplugin,lint,lua,snippet}

            # basic: for basic setting files
            # conf: for plugin setting files
            # dap: for dap setting files
            # lsp: for lsp setting files
            mkdir -p $HOME/.config/nvim/lua/{basic,conf,dap,lsp}

            # init.lua: entry file
            touch $HOME/.config/nvim/init.lua

            # config.lua: user setting file
            touch $HOME/.config/nvim/lua/basic/config.lua

            # keybinds.lua: user keybind file
            touch $HOME/.config/nvim/lua/basic/keybinds.lua

            # plugins.lua: dependent plugins file
            touch $HOME/.config/nvim/lua/basic/plugins.lua

            # settings.lua: for basic neovim settings
            touch $HOME/.config/nvim/lua/basic/settings.lua

            # plugin manager
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
    echo -en "${CYAN}Step11: Install Hack fonts? [y/n] $NC"
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
    echo -en "${CYAN}Step12: Clone my dotfiles from github? [y/n] $NC"
    read -n 1 choice
    case $choice in 
        y)
            echo -e "\n"
            if [ -d $HOME/dotfiles ]
            then
                while true; do
                    echo -e "${CYAN}$HOME/dotfiles folder exists, do you want to remove it and clone a new one? [y/n] $NC"
                    read -n 1 a
                    case $a in
                        y)
                            echo -e "\n"
                            echo -e "${CYAN}Removing $HOME/dotfiles...$NC"
                            rm -rf $HOME/dotfiles
                            echo -e "${CYAN}Cloning $HOME/dotfiles...$NC"
                            git clone https://github.com/yuhanchan/dotfiles.git $HOME/dotfiles
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
                echo -e "${CYAN}$HOME/dotfiles not exists, cloning... $NC"
                git clone https://github.com/yuhanchan/dotfiles.git $HOME/dotfiles
            fi
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


echo -e "${CYAN}Step13: Choose dotfiles to use? $NC"
echo -en "${CYAN}.commonrc .bashrc .zshrc? [y/n] $NC"
while true; do
    read -n 1 choice
    case $choice in 
        y)
            echo -e "\n"
            [[ -d $HOME/.dotfiles ]] && rm -rf $HOME/.dotfiles
            ln -s $HOME/dotfiles/.dotfiles $HOME/.dotfiles

            [[ -f $HOME/.commonrc ]] && rm $HOME/.commonrc
            ln -s $HOME/dotfiles/.commonrc $HOME/.commonrc

            [[ -f $HOME/.bashrc ]] && rm $HOME/.bashrc
            ln -s $HOME/dotfiles/.bashrc $HOME/.bashrc

            [[ -f $HOME/.zshrc ]] && rm $HOME/.zshrc
            ln -s $HOME/dotfiles/.zshrc $HOME/.zshrc
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
echo -en "${CYAN}.tmux.conf? [y/n] $NC"
while true; do
    read -n 1 choice
    case $choice in 
        y)
            echo -e "\n"
            [[ -f $HOME/.tmux.conf ]] && rm $HOME/.tmux.conf
            ln -s $HOME/dotfiles/.tmux.conf $HOME/.tmux.conf

            [[ -d $HOME/.tmux/plugins/tpm ]] && rm -rf $HOME/.tmux/plugins/tpm
            mkdir -p $HOME/.tmux/plugins
            git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm
            echo -e "${GREEN}.tmux.conf created, tpm (tmux plugin manager) installed $NC"
            echo -e "${GREEN}When you first run tmux, do Ctrl+b I to install plugins$NC"
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
echo -en "${CYAN}.vimrc? [y/n] $NC"
while true; do
    read -n 1 choice
    case $choice in 
        y)
            echo -e "\n"
            [[ -f $HOME/.vimrc ]] && rm $HOME/.vimrc
            ln -s $HOME/dotfiles/.vimrc $HOME/.vimrc

            [[ -f $HOME/.vim/autoload/plug.vim ]] && rm $HOME/.vim/autoload/plug.vim
            curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
            https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
            echo -e "${GREEN}.vim plugin manager installed. $NC"
            echo -e "${GREEN}When run vim for the first time, run :PlugInstall to install plugins. $NC"
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