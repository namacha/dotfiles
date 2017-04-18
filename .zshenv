if [[ -z $TMUX ]]; then
    PATH=$HOME/TreeTagger/bin:$HOME/TreeTagger/cmd:/usr/local/bin:$PATH
fi
PATH=$HOME/bin:$PATH
alias sl='ssh lhome'
alias hh='ssh harakiri'
alias nasm='/usr/local/bin/nasm'
export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8
export GOPATH=$HOME/gocode/
export GOROOT=/usr/local/opt/go/libexec
#export PATH=$PATH$GOROOT/bin:$GOPATH/bin
alias camo='export PROMPT=`echo $PROMPT | sed -e s/%n/aaa/g`'
alias nonsmoke='printf "No smoke for: ";python -c "from datetime import *;print(datetime.now() - datetime(2016, 1, 28, 0))"'
