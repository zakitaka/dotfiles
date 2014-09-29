#!/bin/bash

### ディレクトリの絶対パス
abspath=$(cd $(dirname $0) && pwd)

### vimの設定
ln -fsv $abspath/_vimrc ~/.vimrc
ln -fsv $abspath/vimfiles ~/.vim

### NeoBundleのセットアップ
mkdir -p ~/.vim/bundle
git clone https://github.com/Shougo/neobundle.vim ~/.vim/bundle/neobundle.vim

### zshの設定
ln -fsv $abspath/_zshenv ~/.zshenv
ln -fsv $abspath/_zprofile ~/.zprofile
ln -fsv $abspath/_zshrc ~/.zshrc
source ~/.zshenv
source ~/.zprofile
source ~/.zshrc

### brewfileの読み込み
brew bundle
