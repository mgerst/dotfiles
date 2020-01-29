function p {
    if (( ${+TMUX} )); then
        echo "Switching session"
    else
        cd ~/projects/$1
    fi

    if [ $(tmux list-sessions | grep -c $1) -ge 1 ]; then
        tmux attach -t $1
    else
        tmux new-session -s $1 \; attach
    fi
}
