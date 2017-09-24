function cd
  builtin cd $argv
  set -l cd_status $status
  if [ $cd_status -eq 0 ]
    ls
  end
  return $status
end

fish_vi_key_bindings

function fish_mode_prompt
end


set -x PATH $HOME/bin $PATH
set -x fish_user_paths "/usr/local/sbin" $fish_user_paths

#set -x PATH $HOME/.pyenv/versions/2.7.11/bin
pyenv init - | sed -e 's/setenv/set -x/g' > /tmp/pyenv_tmp
source /tmp/pyenv_tmp
rm /tmp/pyenv_tmp

alias sl='ssh lhome'
alias hh='ssh harakiri'
alias nasm='/usr/local/bin/nasm'
set -x JAVA_TOOL_OPTIONS -Dfile.encoding=UTF-8
set -x GOPATH $HOME/gocode/
set -x GOROOT /usr/local/opt/go/libexec
#set -x PATH=$PATH$GOROOT/bin:$GOPATH/bin
alias camo='set -x PROMPT=`echo $PROMPT | sed -e s/%n/aaa/g`'
alias nonsmoke='printf "No smoke for: ";python -c "from datetime import *;print(datetime.now() - datetime(2016, 1, 28, 0))"'
