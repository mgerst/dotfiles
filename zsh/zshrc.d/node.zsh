# n configuration:
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"

if [ -d "$HOME/.npm-global/bin" ]; then
    export PATH="$HOME/.npm-global/bin:$PATH"
fi

if [ -d "$HOME/.yarn/bin" ]; then
    export PATH="$HOME/.yarn/bin:$PATH"
fi
