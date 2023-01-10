local cmd = vim.cmd;
local api = vim.api;

-- Save when losing focus
cmd [[
  au FocusLost * :silent! wall
]]
api.nvim_create_autocmd("FocusLost", {
  command = "silent! wall",
})

-- Resize splits when the window is resized
api.nvim_create_autocmd("VimResized", {
  command = "wincmd =",
})

local cline = api.nvim_create_augroup("CursorLine", { clear = true })
api.nvim_create_autocmd(
  { "InsertLeave", "WinEnter" },
  { pattern = "*", command = "set cursorline", group = cline }
)
api.nvim_create_autocmd(
  { "InsertEnter", "WinLeave" },
  { pattern = "*", command = "set nocursorline", group = cline }
)

local line_return = api.nvim_create_augroup("line_return", { clear = true })
api.nvim_create_autocmd(
  "BufReadPost",
  { pattern = "*",
    command = [[if line("'\"") > 1 && line("'\"") <= line("$") | execute "normal! g`\"" | endif]]
  }
)
