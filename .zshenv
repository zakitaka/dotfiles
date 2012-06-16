# PATHの重複回避
typeset -U path cdpath fpath manpath

# 環境変数の設定(exportする必要はない)
PATH="/usr/local/Cellar/rbenv/0.2.1/bin:$PATH"
eval "$(rbenv init -)"
