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
autoload predict-on
predict-on

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
HISTSIZE=1000
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

#zstyle ':completion:*' auto-description 'specify: %d'
#zstyle ':completion:*' completer _expand _complete _correct _approximate
#zstyle ':completion:*' format 'Completing %d'
#zstyle ':completion:*' group-name ''
#zstyle ':completion:*' menu select=2
#eval "$(dircolors -b)"
#zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
#zstyle ':completion:*' list-colors ''
#zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
#zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
#zstyle ':completion:*' menu select=long
#zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
#zstyle ':completion:*' use-compctl false
#zstyle ':completion:*' verbose true
#
#zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
#zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# 固有の設定の読み込み
[ -f ~/.zshrc.mine ] && source ~/.zshrc.mine
