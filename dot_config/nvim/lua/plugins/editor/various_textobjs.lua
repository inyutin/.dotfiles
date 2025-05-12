--- @type LazyPluginSpec
local various_textobjs_plugin = {
	"chrisgrieser/nvim-various-textobjs",
	lazy = false,
	opts = { keymaps = { useDefault = false } },
	config = function(_, opts)
		require("various-textobjs").setup(opts)
		vim.keymap.set({ "o", "x" }, "iS", "<cmd>lua require('various-textobjs').subword('inner')<CR>")
		vim.keymap.set({ "o", "x" }, "aS", "<cmd>lua require('various-textobjs').subword('outer')<CR>")
	end,
}
return various_textobjs_plugin
