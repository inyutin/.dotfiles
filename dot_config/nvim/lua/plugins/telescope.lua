-- https://github.com/nvim-telescope/telescope.nvim/issues/2104
local findLspClasses = function()
	local symbol_opts = {
		symbols = {
			"class",
		}
	}
	require('telescope.builtin').lsp_dynamic_workspace_symbols(symbol_opts)
end

-- TODO: set up more staff for telescope
--- @type LazyPluginSpec
local telescope_plugin = {
		"nvim-telescope/telescope.nvim",
		tag="0.1.3",
		config=function()
			local opts = { noremap = true, silent = true }
			vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
			vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
			vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)
			vim.keymap.set("n", "<leader>fr", "<cmd>Telescope resume<cr>", opts)
			vim.keymap.set("n", "<leader>fc", findLspClasses, opts)
		end,
}
return telescope_plugin
