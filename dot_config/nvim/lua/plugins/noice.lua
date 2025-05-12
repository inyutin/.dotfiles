--- @type LazyPluginSpec
local noice_plugin = {
	"folke/noice.nvim",
	event = "VeryLazy",
	opts = {
		cmdline = {
			enabled = true,
			view = "cmdline_popup",
		},
		popupmenu = {
			enabled = true,
			backend = "nui",
		},
		lsp = {
			-- override markdown rendering so that **cmp** and other plugins use **Treesitter**
			override = {
				["vim.lsp.util.convert_input_to_markdown_lines"] = true,
				["vim.lsp.util.stylize_markdown"] = true,
				-- ["cmp.entry.get_documentation"] = true, -- requires hrsh7th/nvim-cmp
			},
		},
		-- you can enable a preset for easier configuration
		presets = {
			command_palette = true, -- position the cmdline and popupmenu together
			lsp_doc_border = true, -- add a border to hover docs and signature help
		},
	},
	dependencies = {},
}
return noice_plugin
