local colorscheme_plugin = require("plugins.ui.kanagawa_colorscheme")
local lualine_plugin = require("plugins.ui.lualine")

--- @type LazyPluginSpec[]
return {
	lualine_plugin,
	colorscheme_plugin,
}
