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
