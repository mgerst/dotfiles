if [[ -n "$VIRTUAL_ENV" ]]; then
    source $VIRTUAL_ENV/bin/activate
fi

if [ -d $HOME/.pyenv ]; then
    export PYENV_ROOT="$HOME/.pyenv"
    command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi

if [ -d $HOME/Library/Python/3.9/bin ]; then
    export PATH="$PATH:$HOME/Library/Python/3.10/bin"
fi

alias https='http --default-scheme=https'
