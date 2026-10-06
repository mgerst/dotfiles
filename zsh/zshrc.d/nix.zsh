function nr() {
  pkg=$1
  shift
  nix run nixpkgs#${pkg} -- $@
}

if command -v direnv >/dev/null; then
  eval "$(direnv hook zsh)"
fi
