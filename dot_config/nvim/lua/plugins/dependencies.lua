-- Common dependencies used by lots of plugins
--- @type LazyPluginSpec[]
return {
	{
		"nvim-lua/plenary.nvim",
		lazy = false,
		priority = 1000,
	},
	{
		"nvim-tree/nvim-web-devicons",
		lazy = false,
		priority = 1000,
	},
	{
		"echasnovski/mini.icons",
		priority = 1000,
		version = false,
		lazy = false,
		dependencies = {
			"nvim-tree/nvim-web-devicons",
		},
		opts = {
			style = "glyph",
			filetype = {
				["nu"] = { glyph = ">" },
				["toml"] = { glyph = "" },
				["hyprlang"] = { glyph = "" },
			},
			file = {
				["init.lua"] = { glyph = "", hl = "MiniIconsBlue" },
			},
		},
		specs = {
			{ "nvim-tree/nvim-web-devicons", enabled = false, optional = true },
		},
		init = function()
			package.preload["nvim-web-devicons"] = function()
				require("mini.icons").mock_nvim_web_devicons()
				return package.loaded["nvim-web-devicons"]
			end
		end,
	},
	{
		"nvim-neotest/nvim-nio",
		priority = 1000,
		lazy = false,
	},
	{
		"nvim-lua/popup.nvim",
		lazy = false,
		priority = 999,
	},
	{
		"MunifTanjim/nui.nvim",
		priority = 998,
	},
	{
		"stevearc/dressing.nvim",
		priority = 998,
	},
	{
		"junegunn/fzf",
		build = function()
			vim.fn["fzf#install"]()
		end,
		priority = 998,
	},
}
