local lsp = require('lsp-zero')

lsp.preset('recommended')

lsp.ensure_installed({
  'tsserver',
  'eslint',
  'rust_analyzer',
  'sumneko_lua',
})

lsp.on_attach(function(client, bufnr)
  -- local opts = { buffer = bufnr, remap = false }

  if client.server_capabilities.documentFormattingProvider then
    local au_lsp = vim.api.nvim_create_augroup('lsp_format', { clear = true })
    vim.api.nvim_create_autocmd('BufWritePre', {
      callback = function()
        vim.lsp.buf.format({ async = true })
      end,
      buffer = bufnr,
      group = au_lsp
    })
  end
end)

-- Rust Tools
local rt = require('rust-tools')

rt.setup({
  server = {
    on_attach = function(_, bufnr)
      -- Hover actions
      vim.keymap.set('n', '<c-space>', rt.hover_actions.hover_actions, { buffer = bufnr })
      -- Code action groups
      vim.keymap.set('n', '<leader>a', rt.code_action_group.code_action_group, { buffer = bufnr })
    end
  }
})

lsp.nvim_workspace()

lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
  signs = true,
  update_in_insert = false,
  underline = true,
  severity_sort = true,
  float = true
})
