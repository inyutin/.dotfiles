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
			---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
			basic = true,
			---Extra mapping; `gco`, `gcO`, `gcA`
			extra = true,
		},
	},
	lazy = true,
	keys = {
		{ "gc", mode = "v" },
		{ "gb", mode = "v" },
		'gc',
		'gb',
		'gcc',
		'gcb',
	},
}

--- @type LazyPluginSpec[]
return {
	comment_plugin,
}
