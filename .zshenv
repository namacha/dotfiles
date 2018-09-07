if [[ -z $TMUX ]]; then
    PATH=$HOME/TreeTagger/bin:$HOME/TreeTagger/cmd:/usr/local/bin:$PATH
fi

PATH=/usr/local/opt/openssl/bin:$PATH
PATH=$HOME/bin:$PATH
PATH=$PATH:$GOPATH/bin


export LD_LIBRARY_PATH=/usr/local/opt/openssl/lib:$LD_LIBRARY_PATH
export CPATH=/usr/local/opt/openssl/include:$CPATH
export LDFLAGS=-L/usr/local/opt/openssl/lib
export CPPFLAGS=-I/usr/local/opt/openssl/include
export PKG_CONFIG_PATH=/usr/local/opt/openssl/lib/pkgconfig:$PKG_CONFIG_PATH

alias sl='ssh lhome'
alias hh='ssh harakiri'
alias nasm='/usr/local/bin/nasm'
export JAVA_TOOL_OPTIONS=-Dfile.encoding=UTF-8
export GOPATH=$HOME/gocode/
export GOROOT=/usr/local/opt/go/libexec
#export PATH=$PATH$GOROOT/bin:$GOPATH/bin
alias camo='export PROMPT=`echo $PROMPT | sed -e s/%n/aaa/g`'
alias nonsmoke='printf "No smoke for: ";python -c "from datetime import *;print(datetime.now() - datetime(2016, 1, 28, 0))"'
export HOMEBREW_GITHUB_API_TOKEN="90d45e7a7901c8c26cf496bdda1111d46e59ce1a"

export XDG_CONFIG_HOME=$HOME/.config
