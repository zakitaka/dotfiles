# setting alias
alias where="command -v"
alias j="jobs -l"
alias ls='ls -F -G -w'
alias ll='ls -l'
alias la='ls -a'
alias du="du -h"
alias df="df -h"
alias su="su -l"
alias lvim="vim -c \"normal '0\""
alias st='/Applications/Sublime\ Text\ 2.app/Contents/SharedSupport/bin/subl'
function git(){hub "$@"}
function cdls() {
 # cdがaliasでループするので\をつける
  \cd $1;
  ls -l;
}
alias cd=cdls
# 履歴のフォワードサーチを有効化
stty stop undef
