-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.mapleader = ","

local venv_dir = vim.fn.expand("$HOME/.nvim-venv")
if vim.fn.isdirectory(venv_dir) ~= 0 then
  vim.g.python_host_prog = venv_dir .. "/bin/python"
  vim.g.python3_host_prog = venv_dir .. "/bin/python"
end
