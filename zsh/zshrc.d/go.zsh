if [ -d "/usr/local/go/bin" ]; then
    export PATH="$PATH:/usr/local/go/bin"
fi

if [ -d "$HOME/projects/go" ]; then
    export GOPATH="$HOME/projects/go"
    export PATH="$GOTPATH/bin:$PATH"
fi
