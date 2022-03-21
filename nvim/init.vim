let s:dir = fnamemodify(resolve(expand('<sfile>:p')), ':h')

" Dein ------------------------------------------------------------------------- {{{
set runtimepath+=~/.local/share/dein/repos/github.com/Shougo/dein.vim

exec "source " . s:dir . "/conf.d/plugins.vim"

filetype plugin indent on
" ------------------------------------------------------------------------------ }}}
" Basic Options ---------------------------------------------------------------- {{{
exec "source" . s:dir . "/conf.d/basic.vim"
" ------------------------------------------------------------------------------ }}}
" Convenience mappings---------------------------------------------------------- {{{
exec "source" . s:dir . "/conf.d/mappings.vim"
" ------------------------------------------------------------------------------ }}}
" searching and movement-------------------------------------------------------- {{{
exec "source" . s:dir . "/conf.d/movement.vim"
" ------------------------------------------------------------------------------ }}}
" Folding----------------------------------------------------------------------- {{{
exec "source" . s:dir . "/conf.d/folding.vim"
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
