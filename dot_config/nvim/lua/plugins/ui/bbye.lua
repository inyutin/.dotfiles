-- Close buffers without closing the window
--- @type LazyPluginSpec
local bbye_plugin = {
	"moll/vim-bbye",
	lazy = true,
	config = function(_, _)
		vim.keymap.set("n", "<S-x>", ":Bdelete<CR>", {})
	end,
	keys = {
		"n",
		"<S-x>",
		id = "bbye-delete",
	},
}
return bbye_plugin
