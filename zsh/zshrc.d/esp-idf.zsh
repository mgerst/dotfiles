if [ -d $HOME/custom/esp-idf ]; then
    export IDF_PATH=$HOME/custom/esp-idf

    alias get_idf='. $IDF_PATH/export.sh'
fi

if [ -d $HOME/custom/esp-adf ]; then
    export ADF_PATH=$HOME/custom/esp-adf
fi
