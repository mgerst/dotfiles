vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-- Toggle line numbers
vim.keymap.set('n', '<leader>n', ':setlocal number!<cr>')

-- Tabs
vim.keymap.set('n', '<leader>(', ':tabprev<cr>')
vim.keymap.set('n', '<leader>)', ':tabnext<cr>')

-- Buffers
vim.keymap.set('n', '<leader><', ':bprev<cr>')
vim.keymap.set('n', '<leader>>', ':bnext<cr>')

-- sudo to write
vim.keymap.set('c', 'w!!', 'w !sudo tee % >/dev/null')

-- Toggle [i]nvisible characters
vim.keymap.set('n', '<leader>i', ':set list!<cr>')

vim.keymap.set({'n', 'v', 'o'}, '<tab>', '%')

-- Keep search matches in the middle of the window.
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Easier to type
vim.keymap.set('n', 'H', '^')
vim.keymap.set('n', 'L', '$')
vim.keymap.set('v', 'L', 'g_')

-- Easy buffer navigation
vim.keymap.set('n', '<c-h>', '<c-w>h')
vim.keymap.set('n', '<c-j>', '<c-w>j')
vim.keymap.set('n', '<c-k>', '<c-w>k')
vim.keymap.set('n', '<c-l>', '<c-w>l')
vim.keymap.set('n', '<leader>v', '<c-w>v')

-- Moving Lines around
vim.keymap.set('n', '<A-j>', ':m .+1<cr>==')
vim.keymap.set('n', '<A-k>', ':m .-2<cr>==')
vim.keymap.set('v', '<A-j>', ':m \'>+1<cr>gv=gv')
vim.keymap.set('v', '<A-k>', ':m \'<-2<cr>gv=gv')
