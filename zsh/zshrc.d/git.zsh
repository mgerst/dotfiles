function gbranchclean() {
    git fetch -p && for branch in `git branch -vv | grep ': gone]' | awk '{print $1}'`
    do
        git branch -D $branch
    done
}
alias gbclean=gbranchclean

if alias gstc >/dev/null 2>&1; then
  # Because this is a terrible idea
  unalias gstc
fi

alias lg=lazygit
