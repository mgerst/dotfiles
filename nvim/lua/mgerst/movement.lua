vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.showmatch = true
vim.opt.gdefault = true

vim.opt.scrolloff = 3
vim.opt.sidescroll = 1
vim.opt.sidescrolloff = 10

vim.opt.virtualedit = {"block"}

vim.keymap.set("n", "<leader><space>", ":noh<cr>:call clearmatches()<cr>", { silent = true })
