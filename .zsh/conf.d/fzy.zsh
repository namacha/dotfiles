### 過去に実行したコマンドを選択。ctrl-rにバインド
function fzy-select-history() {
      BUFFER=$(\history -n -r 1 | fzy --query "$LBUFFER")
        CURSOR=$#BUFFER
      }
zle -N fzy-select-history
bindkey '^r' fzy-select-history


function fzy-get-destination-from-cdr() {
    cdr -l | \
    sed -e 's/^[[:digit:]]*[[:blank:]]*//' | \
    fzy --query "$LBUFFER"
}


### 過去に移動したことのあるディレクトリを選択。ctrl-jにバインド
function fzy-cdr() {
  local destination="$(fzy-get-destination-from-cdr)"
  if [ -n "$destination" ]; then
    BUFFER="cd $destination"
    zle accept-line
  else
    zle reset-prompt
  fi
}
zle -N fzy-cdr
bindkey '^p' fzy-cdr
