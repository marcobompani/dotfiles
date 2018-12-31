#!/bin/bash

PACKAGES=(
  git
  gawk
  tmux
  unity-tweak-tool
)

sudo apt-get update
sudo apt-get install ${PACKAGES[*]} -y

for file in data/*; do
    rm -rf ~/.$(basename $file)
    ln -s $(pwd)/$file ~/.$(basename $file)
done

if [ ! -d ~/.vim/bundle/Vundle.vim ]; then
    git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
fi
if [ ! -d ~/peda ]; then
    git clone https://github.com/longld/peda.git ~/peda
    echo "source ~/peda/peda.py" >> ~/.gdbinit
fi

vim +PluginInstall +qall
