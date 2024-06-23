require("user.autocommands")
require("user.keybindings")

local treesitter_ok, _ = pcall(require, "nvim-treesitter")

if treesitter_ok then
  require("user.plugin-configs.treesitter")
end
