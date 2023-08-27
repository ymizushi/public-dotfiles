#!/bin/bash

remove_exists_files()
{
    if [ -e $HOME/$1 ];then
        rm $HOME/$1;
        echo "remove $HOME/$1"
    fi
}

remove_exists_dir()
{
    if [ -e $HOME/$1 ];then
        rm -r $HOME/$1;
        echo "remove $HOME/$1"
    fi
}

DOT_FILES=( .zshrc .tmux.conf .tigrc .ctags  .agignore .gitconfig)

for file in ${DOT_FILES[@]}
do
    remove_exists_files $file
    ln -s $HOME/dotfiles/$file $HOME/$file
    echo "link $HOME/dotfiles/$file to $HOME/$file"
done

echo "symbolic linking is done! ";
