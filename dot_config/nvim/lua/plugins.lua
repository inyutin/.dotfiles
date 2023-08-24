local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  vim.notify("Packer is not installed!", vim.log.levels.ERROR)
	return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
	-- Have packer manage itself
  use "wbthomason/packer.nvim" 

  use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
  use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
	use "moll/vim-bbye" -- Close buffers without closing the window
	
	-- CMP	
  use "hrsh7th/nvim-cmp" -- The completion engine
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
	use "hrsh7th/cmp-nvim-lsp"
	use "hrsh7th/cmp-nvim-lsp-signature-help"

	-- nvim-tree
	use {
		'nvim-tree/nvim-tree.lua',
		requires = {
			'nvim-tree/nvim-web-devicons', -- optional, for file icons
		},
	}

	-- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  use {
		"LhKipp/nvim-nu",
		requires = {
			"nvim-treesitter/nvim-treesitter",
			"jose-elias-alvarez/null-ls.nvim"
		}
  }

	-- Gitsigns
  use "lewis6991/gitsigns.nvim"

	-- Nvterm 
	use {
		"NvChad/nvterm",
		config = function ()
			require("nvterm").setup()
		end,
	}
	
	-- Copilot
  use { "github/copilot.vim" }

	-- Telescope
  use {
		"nvim-telescope/telescope.nvim",
		requires = { 
			'nvim-lua/plenary.nvim' 
		}
	}
 
	-- Mason (LSP)
	use {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"neovim/nvim-lspconfig",
	}

	-- DAP (debugging)
	use {
		"mfussenegger/nvim-dap",
	}

	-- Leap
	use {
		"https://github.com/ggandor/leap.nvim"
	}

	-- nvim-config-local to manage local config files
	use {
  "klen/nvim-config-local",
  config = function()
    require('config-local').setup {
      config_files = { ".nvim.lua" },
    }
  end
}

	-- Colorschemes & UI elements
	use "rebelot/kanagawa.nvim"
	use 'nvim-lualine/lualine.nvim'
	use {
		'akinsho/bufferline.nvim', 
		tag = "v3.*",
		requires = 'nvim-tree/nvim-web-devicons'
	}

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
