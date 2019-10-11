#!/bin/bash
set -x
# Symlinks my dotfiles into the correct place
function check_link() {
    if [ ! -e $HOME/$2 ]; then
        ln -s $HOME/.dotfiles/$1 $HOME/$2
    fi
}

function check_directory() {
    if [ ! -d $HOME/$1 ]; then
        mkdir -p $HOME/$1
    fi
}

function check_repo() {
    if [ ! -d $HOME/$1 ]; then
        git clone $2 $HOME/$1
    fi
}

function check_executable() {
    command -v "$@" >/dev/null 2>&1
}

# ZSH Configuration
if check_executable zsh; then
    check_link zsh/zshrc .zshrc
    check_link zsh/zshrc.d .zshrc.d
    check_directory .zshrc.custom.d
    check_repo .oh-my-zsh git@github.com:robbyrussell/oh-my-zsh.git
else
    echo "[WRN] Could not find zsh, skipping"
fi

if [ ! -f $HOME/.capabilities ]; then
    touch $HOME/.capabilities
fi

# VIM Configuration
if check_executable vim; then
    check_link vim/vimrc .vimrc
    check_directory .vim
    check_link vim/autoload .vim/autoload
    vim +PlugInstall +qall
else
    echo "[ERR] Could not find vim. What is wrong with you."
fi

# TMUX Configuration
if check_executable tmux; then
    check_link tmux/tmux.conf .tmux.conf
else
    echo "[WRN] Could not find tmux, skipping"
fi

# NVIM Configuration
if check_executable nvim; then
    check_directory .config/nvim
    check_link nvim/init.vim .config/nvim/init.vim

    # Setup dein
    if [ ! -d $HOME/.local/share/dein ]; then
        curl https://raw.githubusercontent.com/Shougo/dein.vim/master/bin/installer.sh > /tmp/dein_installer.sh
        sh /tmp/dein_installer.sh $HOME/.local/share/dein
        rm /tmp/dein_installer.sh
        nvim +"call dein#install()" +qall
    fi
else
    echo "[WRN] Could not find nvim, skipping"
fi

# Awesome Configuration
if check_executable awesome; then
    check_link awesome .config/awesome
else
    echo "[WRN] Could not find awesomewm, skipping"
fi

# Git Template
if check_executable git; then
    check_link git_template .git_template
    git config --global init.templatedir $HOME/.git_template

    git config --global user.email mattgerst@gmail.com
    git config --global user.name "Matt Gerst"
else
    echo "[WRN] Could not find git, skipping"
fi
