local bufferline_plugin = require("plugins.ui.bufferline")
local colorscheme_plugin = require("plugins.ui.kanagawa_colorscheme")
local lualine_plugin = require("plugins.ui.lualine")

--- @type LazyPluginSpec[]
return {
	bufferline_plugin,
	lualine_plugin,
	colorscheme_plugin,
}
