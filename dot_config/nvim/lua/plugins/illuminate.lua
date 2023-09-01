--- @type LazyPluginSpec
local illuminate_plugin = {
	"RRethy/vim-illuminate",
	commit = "76f28e858f1caae87bfa45fb4fd09e4b053fc45b",
	opts = {
		providers = {
			'lsp',
			'treesitter',
		},
		delay = 0,
		min_count_to_highlight = 1,
	},
	config = function(_, opts)
		require('illuminate').configure(opts)

		vim.keymap.set("n", "<C-n>", function()
			require("illuminate").goto_next_reference()
		end)
		vim.keymap.set("n", "<C-p>", function()
			require("illuminate").goto_prev_reference()
		end)
	end,
}

--- @type LazyPluginSpec[]
return {
	illuminate_plugin,
}
