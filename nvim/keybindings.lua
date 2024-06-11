local map = require("core.utils.utils").map

vim.g.mapleader = ","
vim.g.maplocalleader = "\\"

-- Toggle line numbers
map("n", "<leader>n", ":setlocal number!<cr>")

-- Tabs
map("n", "<leader>(", ":tabprev<cr>")
map("n", "<leader>)", ":tabnext<cr>")

-- Buffers
map("n", "<leader><", ":bprev<cr>")
map("n", "<leader>>", ":bnext<cr>")

-- sudo to write
map("c", "w!!", "w !sudo tee % >/dev/null")

-- Toggle [i]nvisible characters
map("n", "<leader>i", ":set list!<cr>")

-- Jump between brackets
map({"n", "v", "o"}, "<tab>", "%")

-- Easier to type
map("n", "H", "^")
map("n", "L", "$")
map("v", "L", "g_")

-- Easy buffer navigation
map("n", "<c-h>", "<c-w>h")
map("n", "<c-j>", "<c-w>j")
map("n", "<c-k>", "<c-w>k")
map("n", "<c-l>", "<c-w>l")
