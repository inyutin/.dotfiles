-- https://github.com/nvim-telescope/telescope.nvim/issues/2104
local find_lsp_classes = function()
	local symbol_opts = {
		symbols = {
			"class",
		},
	}
	require("telescope.builtin").lsp_dynamic_workspace_symbols(symbol_opts)
end

-- TODO set up https://github.com/nvim-telescope/telescope-smart-history.nvim
-- TODO set up more telescope extensions

--- @type LazyPluginSpec
local telescope_plugin = {
	"nvim-telescope/telescope.nvim",
	config = function(_, _)
		local telescope = require("telescope")
		local actions = require("telescope.actions")

		local open_after_tree = function(prompt_bufnr)
			-- https://github.com/nvim-treesitter/nvim-treesitter/issues/7952#issuecomment-2996499844
			-- TODO: find a better solution
			vim.defer_fn(function()
				actions.select_default(prompt_bufnr)
			end, 500) -- Delay allows filetype and plugins to settle before opening
		end

		telescope.setup({
			defaults = {
				mappings = {
					n = {
						["<C-d>"] = actions.delete_buffer,
						["<CR>"] = open_after_tree,
					},
					i = {
						["<C-d>"] = actions.delete_buffer,
						["<C-n>"] = actions.cycle_history_next,
						["<C-p>"] = actions.cycle_history_prev,
					},
				},
			},
		})

		local keymaps_opts = { noremap = true, silent = true }
		vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", keymaps_opts)
		vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", keymaps_opts)
		vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", keymaps_opts)
		vim.keymap.set("n", "<leader>fr", "<cmd>Telescope resume<cr>", keymaps_opts)
		vim.keymap.set("n", "<leader>fq", "<cmd>Telescope quickfix<cr>", keymaps_opts)
		vim.keymap.set("n", "<leader>fG", "<cmd>Telescope git_status<cr>", keymaps_opts)
		vim.keymap.set("n", "<leader>fj", "<cmd>Telescope jumplist<cr>", keymaps_opts)
		vim.keymap.set("n", "<leader>flc", find_lsp_classes, keymaps_opts)
	end,
}
return telescope_plugin
