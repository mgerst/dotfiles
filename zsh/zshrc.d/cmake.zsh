function build() {
    if [ -f build.ninja ]; then
        ninja
    elif [ -f Makefile ]; then
        make
    fi
}
