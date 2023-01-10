vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.visualbell = true

vim.opt.list = true
vim.opt.listchars = {
  tab = "▸ ",
  eol = "¬",
  extends = "❯",
  precedes = "❮"
}
vim.opt.showbreak = "↪"
vim.opt.linebreak = true
vim.opt.fillchars = {
  diff = "⣿",
  vert = "│",
  eob = "-",
  fold = "-"
}

vim.opt.matchtime = 3

vim.opt.autowrite = true
vim.opt.shiftround = true
vim.opt.title = true

vim.opt.colorcolumn = "+1"
vim.opt.signcolumn = "yes"

vim.opt.ttimeoutlen = 30

vim.opt.wildignore = { ".o", "*.pyc", "__pycache__", "node_modules/**/*" }

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
