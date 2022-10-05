call dein#begin(expand('~/.local/share/dein'))
call dein#add('Shougo/dein.vim')
call dein#add('Shougo/vimproc.vim', {
    \ 'build': {
    \   'windows': 'tools\\update-dll-mingw',
    \   'cygwin': 'make -f make_cygwin.mak',
    \   'mac': 'make -f make_mac.mak',
    \   'linux': 'make',
    \   'unix': 'gmake',
    \   },
    \ })
call dein#add('Shougo/unite.vim')

" colorscheme & syntax highlighting
call dein#add('mhartington/oceanic-next')
call dein#add('blueshirts/darcula')
call dein#add('Yggdroot/indentLine')
call dein#add('Raimondi/delimitMate')
"call dein#add('valloric/MatchTagAlways')
call dein#add('sheerun/vim-polyglot')
call dein#add('fatih/vim-go')
call dein#add('tpope/vim-rails')
call dein#add('Keithbsmiley/rspec.vim')
call dein#add('sunaku/vim-ruby-minitest')
call dein#add('hashivim/vim-terraform')

" Git helpers
call dein#add('tpope/vim-fugitive')
call dein#add('airblade/vim-gitgutter')
call dein#add('Xuyuanp/nerdtree-git-plugin')

call dein#add('editorconfig/editorconfig-vim')
call dein#add('scrooloose/nerdtree')
call dein#add('bling/vim-airline')
call dein#add('tpope/vim-surround')
call dein#add('tomtom/tcomment_vim')
call dein#add('ap/vim-css-color')
call dein#add('Lokaltog/vim-easymotion')

call dein#add('neomake/neomake')

call dein#add('w0rp/ale')

call dein#add('kshenoy/vim-signature')

" Language Server Stuff
call dein#add('neoclide/coc.nvim', {
    \ 'merged': 0,
    \ 'rev': 'release'
    \})
call dein#add('autozimu/LanguageClient-neovim', {
    \ 'rev': 'next',
    \ 'build': 'bash install.sh',
    \ })
call dein#add('Shougo/echodoc.vim')

" COC
call dein#add('neoclide/coc-eslint', {'do': 'yarn install --frozen-lockfile'})
call dein#add('neoclide/coc-css', {'do': 'yarn install --frozen-lockfile'})
call dein#add('neoclide/coc-highlight', {'do': 'yarn install --frozen-lockfile'})
call dein#add('neoclide/coc-json', {'do': 'yarn install --frozen-lockfile'})
call dein#add('neoclide/coc-tsserver', {'do': 'yarn install --frozen-lockfile'})
call dein#add('neoclide/coc-html', {'do': 'yarn install --frozen-lockfile'})
call dein#add('neoclide/coc-yaml', {'do': 'yarn install --frozen-lockfile'})
call dein#add('elixir-lsp/coc-elixir', {'do': 'yarn install --frozen-lockfile'})
call dein#add('fannheyward/coc-rust-analyzer', {'do': 'yarn install --frozen-lockfile'})
call dein#add('neoclide/coc-solargraph')

" Fuzzy Finder
call dein#add('junegunn/fzf', { 'dir': '~/.fzf', 'build': './install --all', 'merged': 0 })
call dein#add('junegunn/fzf.vim')

" Need to figure out the fonts for this
call dein#add('ryanoasis/vim-devicons')
call dein#add('tiagofumo/vim-nerdtree-syntax-highlight')

" Ensure plugins installed
if dein#check_install()
    call dein#install()
    let pluginsExist=1
endif

call dein#end()
