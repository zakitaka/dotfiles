# setting alias
alias where="command -v"
alias j="jobs -l"
alias ls='ls -F -G -w'
alias ll='ls -l'
alias la='ls -a'
alias du="du -h"
alias df="df -h"
alias su="su -l"

# ロケール設定
LANG=ja_JP.UTF-8

# *** 補完の設定 ***
# 補完の有効化
autoload -Uz compinit
compinit
# 先方予測機能の有効化
#autoload predict-on
#predict-on

# *** プロンプトの設定 ***
autoload -Uz colors
colors
setopt prompt_subst
case ${UID} in
  0)
    PROMPT='${WINDOW:+"[$WINDOW]"}%{$fg[yellow]%}%n@%m %(!.#.$) %{$reset_color%}'
    RPROMPT="[%{$fg[yellow]%}%~%{$reset_color%}]"
    SPROMPT="%{${fg[red]}%}correct: %R -> %r [n,y,a,e]? %{${reset_color}%}"
    ;;
  *)
    PROMPT='${WINDOW:+"[$WINDOW]"}%{$fg[green]%}%n@%m %(!.#.$) %{$reset_color%}'
    RPROMPT="[%{$fg[green]%}%~%{$reset_color%}]"
    SPROMPT="%{${fg[red]}%}correct: %R -> %r [n,y,a,e]? %{${reset_color}%}"
    ;;
esac
    

# *** 履歴の設定 ***
HISTSIZE=50000
SAVEHIST=$HISTSIZE
HISTFILE=~/.zsh_history
setopt hist_ignore_all_dups # 重複の回避
setopt share_history  # zsh間での履歴共有

# *** コマンドの設定 ***
setopt auto_cd      # cdコマンドの省略化
setopt auto_pushd   # cd -<tab>で履歴を表示
setopt correct      # コマンド版もしかして機能
setopt list_packed  # リストをつめて表示
setopt no_list_beep # 補完候補表示時のビープ音を消音化

# *** スタイルの設定 ***
# リストのカラー設定
export LSCOLORS=exfxcxdxbxegedabagacad  # lsコマンドのカラー
zstyle ':completion:*' list-colors 'di=34' 'ln=35' 'so=32' 'ex=31' 'bd=46;34' 'cd=43;34' # 候補リストのカラー
#unset LSCOLORS
#export LSCOLORS=ExFxCxdxBxegedabagacad
#zstyle ':completion:*' list-colors 'di=;34;1' 'ln=;35;1' 'so=;32;1' 'ex=31;1' 'bd=46;34' 'cd=43;34'
# 補完方法のグループ化
zstyle ':completion:*' format '%B%d%b'
zstyle ':completion:*' group-name ''
# 補完候補の選択(２つ以上なければすぐ補完)
zstyle ':completion:*' menu select=2
# 補完対象を大文字小文字区別なく行う
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'



#zstyle ':completion:*' completer _expand _complete _correct _approximate
#eval "$(dircolors -b)"
#zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
#zstyle ':completion:*' menu select=long
#zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
#zstyle ':completion:*' use-compctl false
#zstyle ':completion:*' verbose true
#
#zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
#zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# 固有の設定の読み込み
[ -f ~/.zshrc.mine ] && source ~/.zshrc.mine
