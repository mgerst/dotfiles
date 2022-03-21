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

