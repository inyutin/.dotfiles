return {
	{ "nvim-lua/popup.nvim" },  -- An implementation of the Popup API from vim in Neovim
	{ "nvim-lua/plenary.nvim" }, -- Useful lua functions used ny lots of plugins
	{ "moll/vim-bbye" },        -- Close buffers without closing the window

	-- CMP	
	{ "hrsh7th/nvim-cmp" },   -- The completion engine
	{ "hrsh7th/cmp-buffer" }, -- buffer completions
	{ "hrsh7th/cmp-path" },   -- path completions
	{ "hrsh7th/cmp-cmdline" }, -- cmdline completions
	{ "hrsh7th/cmp-nvim-lsp" },
	{ "hrsh7th/cmp-nvim-lsp-signature-help" },

	-- Copilot
	"github/copilot.vim",

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			'nvim-lua/plenary.nvim'
		}
	},

	-- nvim-config-local to manage local config files
	{
		"klen/nvim-config-local",
		config = function()
			require('config-local').setup {
				config_files = { ".nvim.lua" },
			}
		end
	},
}
