#!/bin/bash

### ディレクトリの絶対パス
abspath=$(cd $(dirname $0) && pwd)
ln -fsv $abspath/_custom.zsh-theme ~/.oh-my-zsh/themes/custom.zsh-theme

### カスタムのaliasを設定
ln -fsv $abspath/custom_alias.zsh ~/.oh-my-zsh/custom/custom_alias.zsh
