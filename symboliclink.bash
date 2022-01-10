#!/bin/bash
DOT_FILES=( .zshrc .tmux.conf .tigrc .ctags  .agignore )

for file in ${DOT_FILES[@]}
do
    remove_exists_files $file
    ln -s $HOME/dotfiles/$file $HOME/$file
    echo "link $HOME/public-dotfiles/$file to $HOME/$file"
done

echo "symbolic linking is done! ";
