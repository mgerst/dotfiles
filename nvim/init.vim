" Dein ------------------------------------------------------------------------- {{{
set runtimepath+=~/.local/share/dein/repos/github.com/Shougo/dein.vim

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
call dein#add('valloric/MatchTagAlways')
call dein#add('sheerun/vim-polyglot')
call dein#add('fatih/vim-go')

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

" Autocomplete
call dein#add('Shougo/deoplete.nvim')
call dein#add('Shougo/neco-vim')
call dein#add('zchee/deoplete-jedi')
call dein#add('zchee/deoplete-go')
call dein#add('zchee/deoplete-clang')
call dein#add('carlitux/deoplete-ternjs')
call dein#add('mhartington/deoplete-typescript')

" Language Server Stuff
call dein#add('autozimu/LanguageClient-neovim', {
    \ 'rev': 'next',
    \ 'build': 'bash install.sh',
    \ })
call dein#add('Shougo/echodoc.vim')

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

filetype plugin indent on
" ------------------------------------------------------------------------------ }}}
" Basic Options ---------------------------------------------------------------- {{{

set encoding=utf8
set autoindent
set showmode
set showcmd
set hidden
set visualbell
set ruler
set number
set relativenumber
set undofile
set undoreload=10000
set list
set listchars=tab:▸\ ,eol:¬,extends:❯,precedes:❮
" set lazyredraw
set matchtime=3
set showbreak=↪
set autowrite
set autoread
set shiftround
set title
set linebreak
set colorcolumn=+1
set signcolumn=yes
set fillchars=diff:⣿,vert:│

" Don't try to highlight lines longer than 800 characters
set synmaxcol=800

" Time out on key codes, but no mappings
" Basically this makes terminal vim work sanely
set notimeout
set ttimeout
set ttimeoutlen=10

" save when losing focus
au FocusLost * :silent! wall

" Resize splits when the window is resized
au VimResized * :wincmd =

" Ignore object files with wildcards, command-t respects this setting
set wildignore+=*.o,*.pyc,__pycache__,"bower_components/**/*","node_modules/**/*"

" Leader {{{
let mapleader=","
let maplocalleader="\\"
" }}}

" Cursor line {{{
" only show cursorline in the current window and in normal mode.

augroup cline
    au!
    au WinLeave,InsertEnter * set nocursorline
    au WinEnter,InsertLeave * set cursorline
augroup END
" }}}

" Tabs, spaces, wrapping {{{
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set wrap
set textwidth=120
set formatoptions=qrnlj
" }}}

" Backups {{{
set backup
set noswapfile

set undodir=~/.vim/tmp/undo//
set backupdir=~/.vim/tmp/backup//
set directory=~/.vim/tmp/swap//

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif
" }}}

" Color scheme {{{
syntax on
colorscheme darcula

" Highlight vcs conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}}\([^=].\+\)\?$'
" }}}

" Line Return {{{
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \   execute 'normal! g`"zvzz' |
        \ endif
augroup END
" }}}

" ------------------------------------------------------------------------------ }}}
" Convenience mappings---------------------------------------------------------- {{{

" Toggle line numbers
nnoremap <leader>n :setlocal number!<cr>

" Tabs
nnoremap <leader>( :tabprev<cr>
nnoremap <leader>) :tabnext<cr>

" Buffers
nnoremap <leader>< :bprev<cr>
nnoremap <leader>> :bnext<cr>

" sudo to write
cnoremap w!! w !sudo tee % > /dev/null

" Toggle [i]nvisible characters
nnoremap <leader>i :set list!<cr>

" Toggle DelimitMate
nnoremap <F3> :DelimitMateSwitch<cr>
inoremap <F3> :DelimitMateSwitch<cr>

" ------------------------------------------------------------------------------ }}}
" searching and movement-------------------------------------------------------- {{{

" Use sane regexes.
nnoremap / /\v
vnoremap / /\v

set ignorecase
set smartcase
set showmatch
set hlsearch
set gdefault

set scrolloff=3
set sidescroll=1
set sidescrolloff=10

set virtualedit+=block

nnoremap <silent> <leader><space> :noh<cr>:call clearmatches()<cr>

map <tab> %

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Easier to type
nnoremap H ^
nnoremap L $
vnoremap L g_

" Easy buffer navigation
nnoremap <c-h> <c-w>h
nnoremap <c-j> <c-w>j
nnoremap <c-k> <c-w>k
nnoremap <c-l> <c-w>l

nnoremap <leader>v <c-w>v

" ------------------------------------------------------------------------------ }}}
" Folding----------------------------------------------------------------------- {{{

set foldlevelstart=5

" Space to toggle folds.
nnoremap <space> za
vnoremap <space> za

" Make z0 recursively open whatever fold we're in, eve if it's partially open
nnoremap z0 zcz0

function! MyFoldText() " {{{
    let line = getline(v:foldstart)

    let nucolwidth = &fdc + &number * &numberwidth
    let windowwidth = winwidth(0) - nucolwidth - 3
    let foldedlinecount = v:foldend - v:foldstart

    " expand tabs into spaces
    let onetab = strpart('          ', 0, &tabstop)
    let line = substitue(line, '\t', onetab, 'g')

    let line = strpart(line, 0, windowwidth - 2 -len(foldedlinecount))
    let fillcharcount = windowwidth - len(line) - len(foldedlinecount)
    return line . '…' . repeat(" ",fillcharcount) . foldedlinecount . '…' . ' '
endfunction " }}}
set foldtext=MyFoldText()

" ------------------------------------------------------------------------------ }}}
" Filetype-specific ------------------------------------------------------------ {{{

" Assembly {{{
augroup ft_asm
    au!
    au FileType asm setlocal noexpandtab shiftwidth=8 tabstop=8 softtabstop=8
augroup END
" }}}
" C {{{
augroup ft_c
    au!
    " au FileType c setlocal foldmethod=marker foldmarker={,}

    " generate header guards
    " au FileType c <localleader>h I#ifndef <ESC>yyPP2gglcwdefine<ESC>jHlcwendif //<ESC>20<esc>
" }}}
" C++ {{{
augroup ft_cpp
    au!
    " au FileType cpp setlocal foldmethod=marker foldmarker={,}

    " Generate header guards
    " au FileType cpp <localleader>h I#ifndef <ESC>yyPP2gglcwdefine<ESC>jHlcwendif //<ESC>20<esc>
augroup END
" }}}
" Go {{{
augroup ft_go
    au!
    au FileType go setlocal nolist
augroup END

let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_structs = 1
let g:go_highlight_operators = 1
let g:go_highlight_build_constraints = 1

let g:go_fmt_command = "goimports"
" }}}
" Javascript {{{
function! NeomakeESlintChecker()
    let l:npm_bin = ''
    let l:eslint = 'eslint'

    if executable('npm')
        let l:npm_bin = split(system('npm bin'), '\n')[0]
    endif

    if strlen(l:npm_bin) && executable(l:npm_bin . '/eslint')
        let l:eslint = l:npm_bin . '/eslint'
    endif

    let b:neomake_javascript_eslint_exe = l:eslint
endfunction

augroup ft_js
    au!
    autocmd FileType javascript,vue :call NeomakeESlintChecker()
augroup END
" }}}
" Makefile {{{
augroup ft_makefile
    au!
    autocmd FileType make :setlocal noexpandtab
augroup END
" }}}
" Vim {{{
augroup ft_vim
    au!

    au FileType vim setlocal foldlevelstart=0
    au FileType vim setlocal foldmethod=marker
    au FileType help setlocal textwidth=78
    au BufWinEnter *.txt if &ft == 'help' | wincmd L | endif

    au BufWritePost $MYVIMRC source %
augroup END
" }}}

" ------------------------------------------------------------------------------ }}}
" Plugin configuraiton --------------------------------------------------------- {{{

" Airline {{{
let g:airline#extensions#tabline#enabled = 1

let g:airline_left_sep = ''
let g:airline_right_sep = ''
" }}}
" Deoplete {{{
let g:deoplete#enable_at_startup = 1
if !exists('g:deoplete#omni#input_patterns')
    let g:deoplete#omni#input_patterns = {}
endif
autocmd! InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" tab-complete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

let g:deoplete#sources#clang#libclang_path = '/usr/lib/llvm-3.8/lib/libclang.so.1'
let g:deoplete#sources#clang#clang_header = '/usr/include/clang/3.8.1/include/'

call deoplete#custom#source('LanguageClient',
            \ 'min_pattern_length',
            \ 2)
" }}}
" Devicons & NERDTree syntax {{{
let g:webdevicons_enable_nerdtree = 1
" }}}
" EasyMotion {{{

" Replace search
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

map <leader>j <Plug>(easymotion-j)
map <leader>k <Plug>(easymotion-k)

let g:EasyMotion_startofline = 0
" }}}
" FZF {{{
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
map <c-p> :FZF<cr>
tmap <c-p> <c-\><c-n>:FZF<cr>
map <leader>l :Lines<cr>
" }}}
" Indentline {{{
let g:indentLine_char = '│'
let g:indentLine_color_dark = 1
" }}}
" Language Server Client {{{
let g:LanguageClient_serverCommands = {
            \ 'python': ['pyls'],
            \ 'ruby': ['solargraph', 'socket'],
            \ 'rust': ['rustup', 'run', 'nightly', 'rls'],
            \ }

nnoremap <silent> K :call LanguageClient#textDocument_hover()<CR>
nnoremap <silent> gd :call LanguageClient#textDocument_definition()<CR>
nnoremap <silent> <F2> :call LanguageClient#textDocument_rename()<CR>
" }}}
" Neomake {{{
" When writing a buffer
function! MyOnBattery()
    if filereadable('/sys/class/power_supply/AC/online')
        return readfile('/sys/class/power_supply/AC/online') == ['0']
    else
        return 0
    endif
endfunction

if MyOnBattery()
    call neomake#configure#automake('w')
else
    call neomake#configure#automake('nw', 250)
endif

let g:neomake_open_list=2
" }}}
" NERDTree {{{
nnoremap <silent> <F2> :NERDTreeToggle<cr>
" }}}

" ------------------------------------------------------------------------------ }}}
