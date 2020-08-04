LOCAL_BIN=$HOME/bin

export XDG_CONFIG_HOME=$HOME/.config

export LANG=ja_JP.UTF-8


export PATH=$LOCAL_BIN/:$PATH
export GOPATH=$HOME/go
PATH=$PATH:$GOPATH/bin

alias camo='export PROMPT=`echo $PROMPT | sed -e s/%n/aaa/g`'
