if [ -f ~/.fzf.zsh ]; then
    source ~/.fzf.zsh
fi

if type fzf > /dev/null; then
  source <(fzf --zsh)
fi
