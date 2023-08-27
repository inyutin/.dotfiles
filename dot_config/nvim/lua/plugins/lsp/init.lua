local set_key = require('helpers.set_key')
local languages_all = require('plugins.lsp.languages.all')

--- @type LazyPluginSpec
local mason_plugin = {
	--- TODO: what else Mason can do, what other options are available?
	"williamboman/mason-lspconfig.nvim",
	tag = "v1.13.0",
	opts = {
		ensure_installed = languages_all.lsp_server_names,
		automatic_installation = true,
	},
	lazy = true,
	dependencies = {
		{
			"williamboman/mason.nvim",
			tag = "v1.6.2",
			opts = {
				enable = true,
				package_dir = vim.fn.stdpath("data") .. "/mason",
			},
		},
	}
}

--- @type LazyPluginSpec
local lsp_config_plugin = {
	"neovim/nvim-lspconfig",
	commit = "f7922e59aeb9bc3e31a660ea4e7405ffa3fc2c3a",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = mason_plugin,
	opts = { servers = languages_all.lsp_servers },
	config = function(_, opts)
		local servers = opts.servers
		for server, server_opts in pairs(servers) do
			require("lspconfig")[server].setup(server_opts)
		end
	end,
}

--- @type LazyPluginSpec
local lsp_zero_plugin = {
	-- TODO: move to v.3 after 20 September 2023
	-- TODO: re-use other parts of lsp-zero.nvim
	"VonHeikemen/lsp-zero.nvim",
	commit = "f084f4a6a716f55bf9c4026e73027bb24a0325a3",
	dependencies = { "neovim/nvim-lspconfig", },
	config = function()
		local lsp_zero = require('lsp-zero').preset({})
		lsp_zero.format_on_save({
			format_opts = {
				async = false,
				timeout_ms = 10000,
			},
			servers = languages_all.formatting_servers,
		})

		lsp_zero.on_attach(function(_, bufnr)
			lsp_zero.default_keymaps({ buffer = bufnr })
		end)

		set_key("n", "<leader>F", ":LspZeroFormat<cr>")

		lsp_zero.setup()
	end,
}

--- @type LazyPluginSpec[]
return {
	lsp_config_plugin,
	lsp_zero_plugin,
}
