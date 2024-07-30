local bbye_plugin = require("plugins.ui.bbye")
local bufferline_plugin = require("plugins.ui.bufferline")
local gitsigns_plugin = require("plugins.ui.gitsigns")
local colorscheme_plugin = require("plugins.ui.kanagawa_colorscheme")
local lualine_plugin = require("plugins.ui.lualine")
local nvim_tree_plugin = require("plugins.ui.nvim_tree")
local outline_plugin = require("plugins.ui.outline")
local undotree_plugin = require("plugins.ui.undotree")
local window_picker_plugin = require("plugins.ui.window_picker")

--- @type LazyPluginSpec[]
return {
  bbye_plugin,
  bufferline_plugin,
  gitsigns_plugin,
  lualine_plugin,
  colorscheme_plugin,
  nvim_tree_plugin,
  outline_plugin,
  undotree_plugin,
  window_picker_plugin,
}
