#!/usr/bin/env bash

bundle=$HOME/.vim/bundle
vundle=$bundle/Vundle.vim

repo=https://github.com/clonezer/my-vimrc/raw/master

# Download "VundleVim/Vundle.vim" Vim Plugin Manager
if [ ! -d $vundle ]; then
  git clone https://github.com/VundleVim/Vundle.vim.git $vundle
fi

# Copy dotfiles
dotfiles=(
  .vimrc
)
for i in ${dotfiles[@]}; do curl -L $repo/$i > $HOME/$i; done

# # PluginInstall: "VundleVim/Vundle.vim" plugin's install command.
# vim +PluginInstall +qall
