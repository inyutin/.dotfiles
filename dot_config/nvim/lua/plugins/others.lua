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

	-- nvim-tree
	{
		'nvim-tree/nvim-tree.lua',
		dependencies = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
	},

	--{ TODO:
	--	"LhKipp/nvim-nu",
	--	requires = {
	--		"nvim-treesitter/nvim-treesitter",
	--		"jose-elias-alvarez/null-ls.nvim"
	--	}
	-- },

	-- Gitsigns
	{ "lewis6991/gitsigns.nvim" },

	-- Copilot
	"github/copilot.vim",

	-- Telescope
	{
		"nvim-telescope/telescope.nvim",
		dependencies = {
			'nvim-lua/plenary.nvim'
		}
	},

	-- DAP (debugging)	
	"mfussenegger/nvim-dap",
	'mfussenegger/nvim-dap-python',

	{ "rcarriga/nvim-dap-ui",   dependencies = { "mfussenegger/nvim-dap" } },

	-- Leap
	"https://github.com/ggandor/leap.nvim",

	-- nvim-config-local to manage local config files
	{
		"klen/nvim-config-local",
		config = function()
			require('config-local').setup {
				config_files = { ".nvim.lua" },
			}
		end
	},

	-- Colorschemes & UI elements
	{
		'akinsho/bufferline.nvim',
		version = "v3.*",
		dependencies = 'nvim-tree/nvim-web-devicons'
	}
}
