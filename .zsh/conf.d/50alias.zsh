#function cd() { builtin cd $@ && ls -G; }

# execute pwd, ls when cd
function chpwd(){printf "$fg[red]%s\n$fg[default]" `pwd`; ls --color=auto}

# C-u to move upper directory
function goup(){echo ;cd ..; zle reset-prompt}
zle -N goup
bindkey "^u" goup


# =========================
#   Function Definitions
# =========================
function psg() #search process
{
  tmp=`ps aux`;
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


alias ta='tmux attach -t'
alias ga='git add'
alias gl='git log --oneline'
alias gs='git status -s -10'
alias gc='git clone'
alias gcm='git commit -m'
#======================
#      LS
#======================
LSCOLORS=DxGxcxdxCxegedabagacad
alias ls='ls --color=auto'
alias ll='ls -al --color=auto'
zstyle ':completion:*' list-colors ''
