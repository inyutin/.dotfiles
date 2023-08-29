-- TODO: learn how to use text-objects
--- @type LazyPluginSpec
local comment_plugin = {
	'numToStr/Comment.nvim',
	tag = 'v0.8.0',
	opts = {
		toggler = {
			line = '<leader>cc',
			block = '<leader>cb',
		},
		opleader = {},
		extra = {},
	},
	lazy = true,
	keys = {
		'<leader>cc',
		'<leader>cb',
	},
}

--- @type LazyPluginSpec[]
return {
	comment_plugin,
}
