#
# ______     ______     __  __     ______     ______    
#/\___  \   /\  ___\   /\ \_\ \   /\  == \   /\  ___\   
#\/_/  /__  \ \___  \  \ \  __ \  \ \  __<   \ \ \____  
#  /\_____\  \/\_____\  \ \_\ \_\  \ \_\ \_\  \ \_____\ 
#  \/_____/   \/_____/   \/_/\/_/   \/_/ /_/   \/_____/ 
#                                                       
# .zshrc 2011-



#echo Welcome to Darwin!  # Oldschool mac style


# ==================
#     Completion
# ==================
autoload -U compinit
compinit
autoload zed
# Verbose
#zstyle ':completion:*' verbose yes
#zstyle ':completion:*:descriptions' format '%B%d%b'
#zstyle ':completion:*:messages' format '%d'
#zstyle ':completion:*:warnings' format 'No matches for: %d'
#zstyle ':completion:*' group-name ''

export LANG=ja_JP.UTF-8


autoload -Uz colors
colors              
setopt prompt_subst 


# ==========================================
#               Prompt
# ==========================================
if [ -f ~/.zsh/prompt.sh ]; then
  source ~/.zsh/prompt.sh
else
  PROMPT="%m:./ LOGNAME$ "
  RPROMPT="~/.zsh/prompt.sh not found"
fi

setopt correct
setopt auto_cd
setopt auto_pushd


# ============================
#   History Settings
# ============================
HISTFILE="$HOME/.zsh_history" 
HISTSIZE=900000
SAVEHIST=100000
#setopt hist_ignore_dups
setopt share_history
setopt HIST_IGNORE_SPACE
setopt extended_history 

setopt list_packed 
setopt nobeep 
bindkey -v


setopt auto_pushd # save history of cd ?


#======================
#      LS
#======================
LSCOLORS=DxGxcxdxCxegedabagacad
alias ls='gls -G --color=always'
alias ll='gls --color=always -hla'
zstyle ':completion:*' list-colors ''


#======================
#      Aliases
#======================
[ -f ~/.zshrc.local ] && source ~/.zshrc.local



#function cd() { builtin cd $@ && ls -G; }

# execute pwd, ls when cd
function chpwd(){printf "$fg[red]%s\n$fg[default]" `pwd`; ls}

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

autoload predict-on


#alias -s py=python 

# ======================
#   Plugins, antigen
# ======================
#if [ -f ~/.zshrc.antigen ]; then
#    source ~/.zshrc.antigen
#fi

if [ -f ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
    bindkey "^J" autosuggest-accept
fi

#if [ -f `brew --prefix`/etc/autojump.zsh ]; then
#    . `brew --prefix`/etc/autojump.zsh
#fi

#if [ -f ~/.zsh/plugin/incr-0.2.zsh ]; then
#    source ~/.zsh/plugin/incr-0.2.zsh
#fi

#source ~/.zsh/plugin/auto-fu.zsh; zle-line-init(){auto-fu-init; }; zle -N zle-line-init
#zstyle ':auto-fu:var' postdisplay $''
#zstyle ':auto-fu:highlight' completion fg=red,bold
