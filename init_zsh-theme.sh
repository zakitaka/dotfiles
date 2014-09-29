#!/bin/bash

### ディレクトリの絶対パス
abspath=$(cd $(dirname $0) && pwd)
ln -fsv $abspath/_custom.zsh-theme ~/.oh-my-zsh/themes/custom.zsh-theme
