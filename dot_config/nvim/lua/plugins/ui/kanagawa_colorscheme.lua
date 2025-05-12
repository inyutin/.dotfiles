--- @type LazyPluginSpec
local kanagawa_colorscheme_plugin = {
	"rebelot/kanagawa.nvim",
	opts = {
		compile = true,
		undercurl = true,
		commentStyle = { italic = true },
		functionStyle = {},
		keywordStyle = { italic = true },
		statementStyle = { bold = true },
		typeStyle = {},
		variablebuiltinStyle = { italic = true },
		specialReturn = true,
		specialException = true,
		transparent = false,
		dimInactive = false,
		globalStatus = false,
		terminalColors = true,
		colors = {},
		theme = "dragon",
		overrides = function(colors)
			local theme = colors.theme
			local illuminate_color_setup = { fg = theme.syn.special2, bg = theme.ui.bg_p1, bold = true }
			local noice_cmdline_popup = { fg = theme.ui.float.fg_border, bg = theme.ui.bg, bold = true }
			return {
				IlluminatedWordText = illuminate_color_setup,
				IlluminatedWordRead = illuminate_color_setup,
				IlluminatedWordWrite = illuminate_color_setup,
				NoiceCmdlinePopupBorder = noice_cmdline_popup,
				NoiceCmdlineIcon = noice_cmdline_popup,
				NoiceCmdlinePopupTitle = { link = "NoiceCmdlinePopupBorder", bold = true },
				NoiceCmdlinePopupBorderSearch = { link = "NoiceCmdlinePopupBorder" },
				NoiceCmdlineIconSearch = { link = "NoiceCmdlineIcon" },
			}
		end,
	},
	priority = 500, -- load after all other plugins, this is recommended
	config = function(_, opts)
		require("kanagawa").setup(opts)
		require("kanagawa").load("dragon")
	end,
}
return kanagawa_colorscheme_plugin
