# Configure rvm
if [ -d $HOME/.rvm/bin ]; then
    # Add RVM to PATH for scripting. Make sure this is the
    # last PATH variable change.
    export PATH="$PATH:$HOME/.rvm/bin"
fi

# Some systems have rbenv instead of rvm
if [ -d $HOME/.rbenv/bin ]; then
    export PATH="$PATH:$HOME/.rbenv/bin"
fi

alias rt="rails test"
alias rts="rails test:system"
alias rta="rails test test:system"
alias rs="rspec"

oms() {
    if [ -f Procfile.dev ]; then
        overmind start -f Procfile.dev
    else
        overmind start
    fi
}
