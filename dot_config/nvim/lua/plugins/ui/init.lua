local bbye_plugin = require("plugins.ui.bbye")
local bufferline_plugin = require("plugins.ui.bufferline")
local gitsigns_plugin = require("plugins.ui.gitsigns")
local harpoon_plugin = require("plugins.ui.harpoon")
local colorscheme_plugin = require("plugins.ui.kanagawa_colorscheme")
local lualine_plugin = require("plugins.ui.lualine")
local nvim_tree_plugin = require("plugins.ui.nvim_tree")
local symbols_outline_plugin = require("plugins.ui.symbols_outline")
local window_picker_plugin = require("plugins.ui.window_picker")

--- @type LazyPluginSpec[]
return {
  bbye_plugin,
  bufferline_plugin,
  gitsigns_plugin,
  harpoon_plugin,
  lualine_plugin,
  colorscheme_plugin,
  nvim_tree_plugin,
  symbols_outline_plugin,
  window_picker_plugin,
}
