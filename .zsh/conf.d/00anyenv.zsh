export PATH="$HOME/.pyenv/bin:$PATH"

#pyenv() {
#    unfunction "$0"
#    _pyenv_init
#    $0 "$@"
#}

_pyenv_init() {
    if [ -z $PYENV_INIT_DONE ]; then
        echo "_pyenv_init"
        eval "$(pyenv init -)"
        eval "$(pyenv virtualenv-init -)"
        export PYENV_INIT_DONE="true"
    fi
}

#_pyenv_init

#(_pyenv_init &) > /dev/null 2>&1
