# -*- sh -*-

echo Welcome to Darwin!

autoload -U compinit
compinit
autoload zed #zshのエディタ zed

export LANG=ja_JP.UTF-8


autoload -Uz colors #
colors              # env
setopt prompt_subst # 


local GREEN=$'%{\e[1;32m%}'
local YELLOW=$'%{\e[1;33m%}'
local BLUE=$'%{\e[1;34m%}'
local RED=$'%{\e[1;35m%}'
local DEFAULT=$'%{\e[1;m%}'

#PROMPT=$'\n'$GREEN'${USER}@${HOSTNAME} '$YELLOW'%~ '$'\n'$DEFAULT'%(!.#.$) '
#PROMPT="%m:%./ $LOGNAME$ " #hello-mba: Directory ayu$ 
case ${UID} in
0)
PROMPT="%m:./ $fg[red]$LOGNAME$[default]# "
precmd () {
  PROMPT="%(?.[36m'_'$fg[default] %m:$fg[green]%./$fg[default] $fg[cyan]$LOGNAME$fg[default]# .$fg[red];_;$fg[default] %m:$fg[green]%./ $fg[default]$fg[cyan]$LOGNAME$fg[default]# )"
}

  ;;
*)
PROMPT="%m:./ $LOGNAME$ "
precmd () {
  PROMPT="%(?.[36m'_'$fg[default] %m:$fg[green]%./$fg[default] $fg[red]$LOGNAME$fg[default]$ .$fg[red]>_<$fg[default] %m:$fg[green]%./ $fg[default]$fg[red]$LOGNAME$fg[default]$ )"
}
  ;;
esac
#RPROMPT="`python /Users/ayu/geektool/scripts/batt.py -p`%%"
SPROMPT="$fg[green]%-_-< Did you mean $fg[red]%r$fg[green] ? [n,y,a,e]: "


setopt correct #スペルミスを指摘
setopt auto_cd #ディレクトリ名だけで移動
setopt auto_pushd


HISTFILE="$HOME/.zsh_history" #
HISTSIZE=900000               # 履歴とか
SAVEHIST=100000               #
#setopt hist_ignore_dups       # 重複した履歴を保存しない
setopt share_history          #
setopt HIST_IGNORE_SPACE      #
setopt extended_history #実行時刻と実行時間も保存

setopt list_packed    #補完候補を詰める
setopt nobeep                 #ビープ音なし
bindkey -v


setopt auto_pushd #cdの履歴保存？


export LSCOLORS=DxGxcxdxCxegedabagacad
export TERM=xterm-color
zstyle ':completion:*' list-colors ''

#function cd() { builtin cd $@ && ls -G; }
#cdした時ls
function chpwd(){ls -G}
#C-u で一つ上の階層
function goup(){echo ;cd ..; zle reset-prompt}
zle -N goup
bindkey "^u" goup

#===================================
#alias
#===================================
alias ls='ls -G'
alias ll='ls -hla'
[ -f ~/.zshrc.local ] && source ~/.zshrc.local


#============
# my function
#============
function psg() #search process
{   
  tmp=`psa`;
  echo $tmp | head -n 1
  echo $tmp | grep $* | grep -v grep
}

function cnt() #count the number of files
{
  while [ -n "$1" ]
  do
    dir=$1
    list=`ls -1 $dir`
    if [ "$dir" = "" ] ; then
      printf "%s  %s\n" `pwd | sed -e "s/\/Users\/ayu/~\//" | sed -e "s/\/\//\//"` `echo $list|wc -l`
    else
      printf "%s  %s\n" $dir `echo $list|wc -l`
    fi
    shift
  done
}

autoload predict-on 先方予測
#predict-on　　　　　先方予測

alias -s py=python #.pyのファイルをファイル名だけで実行

#プラグイン
source ~/.zsh/plugin/incr*.zsh
#source ~/.zsh/plugin/auto-fu.zsh; zle-line-init(){auto-fu-init; }; zle -N zle-line-init
#zstyle ':auto-fu:var' postdisplay $''
#zstyle ':auto-fu:highlight' completion fg=red,bold

###############
#環境変数
################
export sl4a=/sdcard/sl4a/scripts  #アンドロイドのやつ

#TERM=xterm-256color
TERM=screen-256color

#echo "Welcome to Darwin!"

#すべてのユーザーのログイン・ログアウトを関し
watch="all"
