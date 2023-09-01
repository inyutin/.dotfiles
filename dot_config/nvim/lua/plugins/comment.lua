--- @type LazyPluginSpec
local comment_plugin = {
	'numToStr/Comment.nvim',
	tag = 'v0.8.0',
	opts = {
		padding = true,
		sticky = true,
		toggler = {
			line = 'gcc',
			block = 'gbc',
		},
		opleader = {
			line = 'gc',
			block = 'gb',
		},
		---LHS of extra mappings
		extra = {
			above = 'gcO',
			below = 'gco',
			eol = 'gcA',
		},
		mappings = {
			basic = true,
			extra = true,
		},
	},
	lazy = true,
	keys = {
		'gc',
		'gb',
		'gcc',
		'gcb',
		{ "gc", mode = "v", id = "gc" },
		{ "gb", mode = "v", id = "gb" },
	},
}

--- @type LazyPluginSpec[]
return {
	comment_plugin,
}
