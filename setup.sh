#!/bin/bash

# git
VAR=`git --version`
if [ $? -ne 0 ]; then
    echo "please install git."
    exit
fi

# zsh
# VAR=`zsh --version`
# if [ $? -ne 0 ]; then
#     echo "please insltall zsh"
#     exit
# fi
# if [ ! -d ~/.oh-my-zsh ]; then
#     git clone https://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh
# fi
# if [ -e ~/.zshrc ]; then
#     mv ~/.zshrc ~/.zshrc.backup
# fi
# cp ~/.oh-my-zsh/templates/zshrc.zsh-template ~/.zshrc
# echo "## start chsh"
# chsh -s /bin/zsh


# vim setting
# VAR=`vim --version | grep +lua`
# if [ $?  -ne 0 ]; then
#     echo "vim is not installed, or no lua support"
#     exit
# fi
if [ ! -f ~/.vim/bundle ]; then
    mkdir -p ~/.vim/bundle
fi
if [ ! -e ~/.vim/bundle/neobundle.vim ]; then
    git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim
fi
cp .vimrc ~/.vimrc

VAR=`printenv TERM`
if [ $VAR == "xterm" ]; then
    echo "export TERM='xterm-256color'" >> ~/.zshrc 
fi 
