local api = vim.api;

-- Assembly {{{
local ft_asm = api.nvim_create_augroup('ft_asm', { clear = true })
api.nvim_create_autocmd('FileType', {
  pattern = "asm",
  command = "setlocal noexpandtab shiftwidth=8 tabstop=8 softtabstop=8",
  group = ft_asm,
})
-- }}}

-- Go {{{
local ft_go = api.nvim_create_augroup('ft_go', { clear = true })
api.nvim_create_autocmd('FileType', {
  pattern = 'go',
  command = 'setlocal nolist',
  group = ft_go,
})
-- }}}

-- LaTeX {{{
local ft_tex = api.nvim_create_augroup('ft_tex', { clear = true })
api.nvim_create_autocmd('FileType', {
  pattern = 'tex',
  command = ':set conceallevel=0',
  group = ft_tex,
})
-- }}}

-- Makefile {{{
local ft_make = api.nvim_create_augroup('ft_make', { clear = true })
api.nvim_create_autocmd('FileType', {
  pattern = 'make',
  command = ':setlocal noexpandtab',
  group = ft_make,
})
-- }}}

-- Nomad {{{
local ft_nomad = api.nvim_create_augroup('ft_nomad', { clear = true })
api.nvim_create_autocmd('FileType', {
  pattern = 'hcl',
  command = ':setlocal tabstop=2 shiftwidth=2 expandtab',
  group = ft_nomad,
})
-- }}}

-- Lua {{{
local ft_lua = api.nvim_create_augroup('ft_lua', { clear = true })
api.nvim_create_autocmd('FileType', {
  pattern = 'lua',
  command = ':setlocal tabstop=2 shiftwidth=2 expandtab',
  group = ft_lua,
})
-- }}}
