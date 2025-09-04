local ensure_installed = {
	-- Languages
	"python",
	"lua",
	-- Markup
	"dockerfile",
	"markdown",
	"json",
	"hyprlang",
	-- Shell
	"bash",
	"nu",
}

--- @type LazyPluginSpec
local treesitter_plugin = {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"tree-sitter-grammars/tree-sitter-hyprlang",
	},
	build = ":TSUpdate",
	config = function(_, _)
		local configs = require("nvim-treesitter.configs")
		configs.setup({
			modules = {},
			ensure_installed = ensure_installed,
			sync_install = false,
			auto_install = false,
			ignore_install = { "" },
			highlight = {
				enable = true,
				disable = {}, -- list of language that will be disabled
				additional_vim_regex_highlighting = false,
			},
		})
	end,
}

-- TODO: how to load this lazily?
--- @type LazyPluginSpec
local treesitter_context_plugin = {
	"nvim-treesitter/nvim-treesitter-context",
	dependencies = {
		"nvim-treesitter/nvim-treesitter",
	},
	opts = {
		enable = false,
		max_lines = 0,
		min_window_height = 0,
		line_numbers = true,
		multiline_threshold = 20,
		trim_scope = "outer",
		mode = "cursor",
		separator = nil,
		zindex = 20,
		on_attach = nil,
	},
	config = function(_, opts)
		local ts_context = require("treesitter-context")
		ts_context.setup(opts)
		vim.keymap.set("n", "<leader>C", ":TSContextToggle<cr>")
	end,
}

--- @type LazyPluginSpec[]
return {
	treesitter_plugin,
	treesitter_context_plugin,
}
