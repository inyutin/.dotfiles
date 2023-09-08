--- @type LazyPluginSpec
local flash_plugin = {
	"folke/flash.nvim",
	event = "VeryLazy",
	opts = {},
	keys = {
		{ "s", mode = { "n", "o", "x" }, function() require("flash").jump() end,       id = "Flash" },
		{ "S", mode = { "n", "o", "x" }, function() require("flash").treesitter() end, id = "Flash Treesitter" },
	},
}
return flash_plugin
