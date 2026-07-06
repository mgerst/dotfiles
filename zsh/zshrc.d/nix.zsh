function nr() {
  pkg=$1
  shift
  nix run nixpkgs#${pkg} -- $@
}
