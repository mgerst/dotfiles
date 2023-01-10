vim.keymap.set({'v', 'n'}, '/', '<Plug>(easymotion-sn)')
vim.keymap.set('o', '/', '<Plug>(easymotion-tn)')
vim.keymap.set({'v', 'n'}, 'n', '<Plug>(easymotion-next)')
vim.keymap.set({'v', 'n'}, 'N', '<Plug>(easymotion-prev)')

vim.keymap.set({'v', 'n'}, '<leader>j', '<Plug>(easymotion-j)')
vim.keymap.set({'v', 'n'}, '<leader>k', '<Plug>(easymotion-k)')

vim.g.EasyMotion_startofline = 0
