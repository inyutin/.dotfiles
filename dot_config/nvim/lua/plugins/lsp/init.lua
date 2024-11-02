local languages_all = require("plugins.lsp.languages.all")
local config = require("plugins.lsp.config")

local cmp_plugin = require("plugins.lsp.cmp")
local dap_plugin = require("plugins.lsp.dap")
local garbage_day_plugin = require("plugins.lsp.garbage_day")
local lsp_signature_plugin = require("plugins.lsp.lsp_signature")

--- @type LazyPluginSpec
local neoconf_plugin = {
	"folke/neoconf.nvim",
	opts = {},
}

local mason_plugin = {
	"williamboman/mason.nvim",
	opts = {
		enable = true,
		package_dir = vim.fn.stdpath("data") .. "/mason",
	},
}

--- @type LazyPluginSpec
local mason_lsp_config_plugin = {
	--- TODO: what else Mason can do, what other options are available?
	"williamboman/mason-lspconfig.nvim",
	opts = function()
		return {
			ensure_installed = languages_all.get_all_lsp_server_names({ "nushell", "nixd", "gleam" }),
			automatic_installation = true,
		}
	end,
	lazy = true,
	dependencies = {
		mason_plugin,
	},
}

--- @type LazyPluginSpec
local conform_plugin = {
	"stevearc/conform.nvim",
	dependencies = {
		mason_plugin,
		"zapling/mason-conform.nvim",
	},
	config = function(_, _)
		local conform_setup = languages_all.get_combined_conform_setup()
		require("conform").setup(conform_setup)
		vim.api.nvim_create_autocmd("BufWritePre", {
			pattern = "*",
			callback = function(args)
				require("conform").format({ bufnr = args.buf, quiet = true })
			end,
		})

		local formatters_by_ft = conform_setup.formatters_by_ft

		local formatters = {}
		local not_formatters = { "ruff_format", "ruff_fix", "alejandra" }

		for _, ft_formatters in pairs(formatters_by_ft) do
			for _, formatter in ipairs(ft_formatters) do
				if not vim.tbl_contains(not_formatters, formatter) then
					table.insert(formatters, formatter)
				end
			end
		end

		require("mason-conform").setup({
			ensure_installed = formatters,
		})
	end,
}

--- @type LazyPluginSpec
local lsp_config_plugin = {
	"neovim/nvim-lspconfig",
	dependencies = {
		neoconf_plugin,
		mason_lsp_config_plugin,
		cmp_plugin,
		conform_plugin,
	},
	opts = function()
		return {
			servers = languages_all.get_all_lsp_servers(),
		}
	end,
	config = function(_, opts)
		local servers = opts.servers
		for server, server_opts in pairs(servers) do
			require("lspconfig")[server].setup(server_opts)
		end

		local lsp_settings = config.get_lsp_settings()
		vim.g.inlay_hints_visible = lsp_settings.inlay_hints_enabled

		local signs = { Error = "", Warn = " ", Hint = "", Info = " " }
		vim.diagnostic.config({
			virtual_text = true,
			update_in_insert = false,
			severity_sort = true,
			float = {
				border = "rounded",
				source = true,
			},
		})
		for type, icon in pairs(signs) do
			local hl = "DiagnosticSign" .. type
			vim.fn.sign_define(hl, { text = icon, texthl = hl, linehl = "", numhl = "" })
		end
	end,
}

--- @type LazyPluginSpec[]
return {
	conform_plugin,
	lsp_config_plugin,
	cmp_plugin,
	dap_plugin,
	garbage_day_plugin,
	lsp_signature_plugin,
}
