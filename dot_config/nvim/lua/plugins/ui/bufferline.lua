--- @type LazyPluginSpec
local bufferline_plugin = {
	"akinsho/bufferline.nvim",
	opts = {
		options = {
			themable = true,
			numbers = "ordinal",
			color_icons = true,
			show_buffer_icons = true,
			offsets = { { filetype = "NvimTree", text = "File Explorer", padding = 1, separator = true } },
			custom_filter = function(buf_number, _)
				for _, value in ipairs({ "NvimTree", "help", "qf" }) do
					-- qf is for lsp references
					if vim.bo[buf_number].filetype == value then
						return false
					end
				end
				return true
			end,
		},
	},
	config = function(_, opts)
		require("bufferline").setup(opts)

		-- Pick
		vim.keymap.set("n", "gbp", ":BufferLinePick<cr>")

		-- Toggle
		vim.keymap.set("n", "gbP", ":BufferLineTogglePin<cr>")

		-- Navigate by tabs
		vim.keymap.set("n", "<Tab>", ":BufferLineCycleNext<CR>", { noremap = true, silent = true })
		vim.keymap.set("n", "<S-Tab>", ":BufferLineCyclePrev<CR>", { noremap = true, silent = true })

		-- Navigate by numbers
		vim.keymap.set("n", "<leader>1", ":BufferLineGoToBuffer 1<cr>")
		vim.keymap.set("n", "<leader>2", ":BufferLineGoToBuffer 2<cr>")
		vim.keymap.set("n", "<leader>3", ":BufferLineGoToBuffer 3<cr>")
		vim.keymap.set("n", "<leader>4", ":BufferLineGoToBuffer 4<cr>")
		vim.keymap.set("n", "<leader>5", ":BufferLineGoToBuffer 5<cr>")
		vim.keymap.set("n", "<leader>6", ":BufferLineGoToBuffer 6<cr>")
		vim.keymap.set("n", "<leader>7", ":BufferLineGoToBuffer 7<cr>")
		vim.keymap.set("n", "<leader>8", ":BufferLineGoToBuffer 8<cr>")
		vim.keymap.set("n", "<leader>9", ":BufferLineGoToBuffer 9<cr>")
		vim.keymap.set("n", "<leader>$", ":BufferLineGoToBuffer -1<cr>")
	end,
}
return bufferline_plugin
