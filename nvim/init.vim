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
nnoremap <leader>b :Buffers<cr>

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

" Moving lines around
nnoremap <A-j> :m .+1<CR>==
nnoremap <A-k> :m .-2<CR>==
vnoremap <A-j> :m '>+1<CR>gv=gv
vnoremap <A-k> :m '<-2<CR>gv=gv

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
" LaTeX {{{
augroup ft_tex
    au!
    autocmd FileType tex :set conceallevel=0
augroup END
" }}}
" Makefile {{{
augroup ft_makefile
    au!
    autocmd FileType make :setlocal noexpandtab
augroup END
" }}}
" Nomad {{{
augroup ft_nomad
    au!
    autocmd FileType hcl :setlocal tabstop=2 shiftwidth=2
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
" Ruby {{{
augroup ft_ruby
    au!

    au FileType vim setlocal foldmethod=syntax
    au FileType vim setlocal foldlevel=99
augroup END
" }}}
" Python {{{
let g:python_highlight_all = 1
" }}}

" ------------------------------------------------------------------------------ }}}
" Plugin configuraiton --------------------------------------------------------- {{{

" Airline {{{
let g:airline#extensions#tabline#enabled = 1

let g:airline_left_sep = ''
let g:airline_right_sep = ''
" }}}
" CoC {{{
" don't give |ins-completion-menu| messages.
set shortmess+=c

function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1] =~# '\s'
endfunction

" Use tab to trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
    \ pumvisible() ? "\<C-n>" :
    \ <SID>check_back_space() ? "\<TAB>" :
    \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugins
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" show documentation
function! s:show_documentation()
    if (index(['vim', 'help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction
nnoremap <silent> K :call <SID>show_documentation()<CR>

let g:coc_global_extensions = [
        \ "coc-css", "coc-elixir", "coc-eslint", "coc-highlight",
        \ "coc-html", "coc-json", "coc-rust-analyzer",
        \ "coc-solargraph", "coc-tsserver", "coc-yaml"
      \ ]

" show error, otherwise documentation, on hold
" function! ShowDocIfNoDiagnostic(timer_id)
"   if (coc#util#has_float() == 0)
"     silent call CocActionAsync('doHover')
"   endif
" endfunction
" function! s:show_hover_doc()
"     call timer_start(200, 'ShowDocIfNoDiagnostic')
" endfunction
" autocmd CursorHoldI * :call <SID>show_hover_doc()
" autocmd CursorHold * :call <SID>show_hover_doc()

" common editor actions
nmap <leader>rn <Plug>(coc-rename)
xmap <leader>f <Plug>(coc-format-selected)
nmap <leader>f <Plug>(coc-format-selected)

augroup cocgroup
    autocmd!
    " Setup formatexpr specified filetype(s).
    autocmd FileType typescript.json setl formatexpr=CocAction('formatSelected')

    " Update signature help on jump placeholder
    autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Fix autofix problem of current line
nmap <leader>gf <Plug>(coc-fix-current)
" }}}
" DelimitMate {{{
let delimitMate_expand_cr = 1
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
map <c-p> :Files<cr>
tmap <c-p> <c-\><c-n>:Files<cr>
map <leader>l :Lines<cr>
map <leader>; :Files<cr>
map <leader>m :Buffers<cr>
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
