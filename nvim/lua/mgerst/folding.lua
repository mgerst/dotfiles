-- Space to toggle folds.
vim.keymap.set("n", "<space>", "za")
vim.keymap.set("v", "<space>", "za")

-- Make z0 recursively open whatever fold we're in, even if it's partially open
vim.keymap.set("n", "z0", "zcz0")

-- {{{
local custom_fold_text = function()
  local line = vim.fn.getline(vim.v.foldstart)

  local line_count = vim.v.foldend - vim.v.foldstart + 1
  return " ⚡ " .. line .. ": " .. line_count .. " lines"
end
-- }}}

vim.opt.foldtext = 'v:lua.custom_fold_text()'
