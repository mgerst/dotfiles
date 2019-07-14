# Various Shell configurations and aliases

# Variables
export EDITOR='nvim'
export MTR_OPTIONS=-t

[ -f $HOME/.fzf.zsh ] && source $HOME/.fzf.zsh


# Functions
fbr() {
    local branches branch
    branches=$(git branch --all | grep -v HEAD) &&
    branch=$(echo "$branches" | fzf-tmux -d $(( 2 + $(wc -l <<< "$branches") )) +m) &&
    git checkout $(echo "$branch" | sed "s/.* //" | sed "s#remotes/[^/]*/##")
}

capability() {
    grep $1 $HOME/.capabilities
}

# Various Config
autoload -U +X bashcompinit && bashcompinit
bindkey '^ ' autosuggest-accept

if [ -f $HOME/bin/vault ]; then
    complete -o nospace -C $HOME/bin/vault vault
fi

if [[ "$TERM" == "xterm-termite" ]]; then
    export TERM="xterm"
fi

if [ -n "$TMUX" ]; then
    export TERM="screen-256color"
fi

export GPG_TTY=$(tty)
if [[ -n "$SSH_CONNECTION" ]]; then
    export PINENTRY_USER_DATA="USE_CURSES=1"
fi

if [ -f "$HOME/.dircolors" ]; then
    eval `dircolors $HOME/.dircolors`
fi

if capability touchpad; then
    synclient TapButton3=2 TapButton2=3 TapButton1=0
fi
