local GRAY=$'%{\e[1;30m%}'
local RED=$'%{\e[1;31m%}'
local GREEN=$'\e[1;32m'
local YELLOW=$'%{\e[1;33m%}'
local BLUE=$'%{\e[1;34m%}'
local MAGENTA=$'%{\e[1;35m%}'
local CYAN=$'%{\e[1;36m%}'
local BOLDWHITE=$'%{\e[1;37m%}'
local DEFAULT=$'%{\e[1;m%}'


# ============================
#      Color Settings
# ============================
ROOTUESRCOLOR=green
USERCOLOR=red
DIRCOLOR=white
SUCCESSCOLOR=cyan
FAILCOLOR=red
SUCCESS="'_'"
SUCCESS="✖╹◡╹✖"
FAIL=">_<"
FAIL="✖>_<✖"

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable svn
zstyle ':vcs_info:*' branchformat '%b:r%r'
zstyle ':vcs_info:*' formats '[%s]%b'
zstyle ':vcs_info:*' actionformats '[%s]%b|%a'
RPROMPT="%1(v|%1v|)"


local _pre=''
_preexec() {
  _pre="$1"
}
autoload -Uz add-zsh-hook
add-zsh-hook preexec _preexec

precmd() {
  _r=$?
  case "${_pre}" in
    cd*|svn\ up*|svn\ sw*)
      export RPROMPT=""
      if test -d .svn
      then
        LANG=en_US.UTF-8 vcs_info
        [[ -n "$vcs_info_msg_0_" ]] && export RPROMPT=[`echo $vcs_info_msg_0_ | awk -F ':' '{print $2}'`]
#        [[ -n "$vcs_info_msg_0_" ]] && export PROMPT="($rev)"$PROMPT
      fi
      ;;
  esac

  return ${_r}
}

# ✖╹◡╹✖ wsl:.zsh/ ayu$
# wsl: prog/ ❯

SUCCESS="%F{red}❯%F{yellow}❯%F{cyan}❯%f"
FAIL="%F{red}❯❯❯%f"

STATSUCCESS="%F{$SUCCESSCOLOR}$SUCCESS%f "
STATFAIL="%F{$FAILCOLOR}$FAIL%f "

case ${UID} in
0)  # root user
#PROMPT="%m:./ $GREEN$LOGNAME$DEFAULT# "
MAINPROMPT="%m:%F{$DIRCOLOR}%./%f %F{$ROOTUESRCOLOR}%n%f# "

  ;;
*)
MAINPROMPT="wsl:%F{$DIRCOLOR}%./%f %F{$USERCOLOR}%n%f$ "
MAINPROMPT="%F{$DIRCOLOR}%./%f "
esac

PROMPT="%(?.$STATSUCCESS$MAINPROMPT.$STATFAIL$MAINPROMPT)"
PROMPT="%(?.$MAINPROMPT$STATSUCCESS.$MAINPROMPT$STATFAIL)"
SPROMPT="$fg[green]%^[-_-< Did you mean $fg[red]%r$fg[green] ? [n,y,a,e]: "

