local languages_all = require('plugins.lsp.languages.all')
local cmp_plugin = require('plugins.lsp.cmp')


--- @type LazyPluginSpec
local neoconf_plugin = {
	"folke/neoconf.nvim",
	commit = "4a344462d45a08e81b19aa3d63d2bfe06404eec0",
	cmd = "Neoconf",
	lazy = true,
	opts = {}
}


--- @type LazyPluginSpec
local mason_plugin = {
	--- TODO: what else Mason can do, what other options are available?
	"williamboman/mason-lspconfig.nvim",
	tag = "v1.13.0",
	opts = function()
		return {
			ensure_installed = languages_all.get_all_lsp_server_names(),
			automatic_installation = true,
		}
	end,
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

local null_ls_plugin = {
	"jose-elias-alvarez/null-ls.nvim",
	config = function(_, _)
		-- TODO: use more null-ls features
		local null_ls = require("null-ls")
		local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

		null_ls.setup({
			sources = languages_all.get_all_null_ls_sources(),
			on_attach = function(client, bufnr)
				if client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						group = augroup,
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({ bufnr = bufnr })
						end,
					})
				end
			end,
		})
	end,
}

--- @type LazyPluginSpec
local lsp_config_plugin = {
	"neovim/nvim-lspconfig",
	commit = "f7922e59aeb9bc3e31a660ea4e7405ffa3fc2c3a",
	event = { "BufReadPre", "BufNewFile" },
	dependencies = {
		neoconf_plugin,
		mason_plugin,
		cmp_plugin,
		null_ls_plugin,
	},
	opts = function()
		return {
			servers = languages_all.get_all_lsp_servers()
		}
	end,
	config = function(_, opts)
		local servers = opts.servers
		for server, server_opts in pairs(servers) do
			require("lspconfig")[server].setup(server_opts)
		end
	end,
}

--- @type LazyPluginSpec[]
return {
	lsp_config_plugin,
	cmp_plugin,
}
