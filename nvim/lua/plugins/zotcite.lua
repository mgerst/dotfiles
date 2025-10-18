local python_path = vim.fn.expand("$HOME/.nvim-venv/bin/python3")

return {
  "jalvesaq/zotcite",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    require("zotcite").setup({
      python_path = python_path,
    })
  end,
}
