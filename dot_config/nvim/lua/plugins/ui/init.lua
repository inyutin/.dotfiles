local bufferline_plugin = require("plugins.ui.bufferline")
local gitsigns_plugin = require("plugins.ui.gitsigns")
local colorscheme_plugin = require("plugins.ui.kanagawa_colorscheme")
local lualine_plugin = require("plugins.ui.lualine")
local nvim_tree_plugin = require("plugins.ui.nvim_tree")

--- @type LazyPluginSpec[]
return {
	bufferline_plugin,
	gitsigns_plugin,
	lualine_plugin,
	colorscheme_plugin,
	nvim_tree_plugin,
}
