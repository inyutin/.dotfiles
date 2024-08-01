local dap_plugin = require("plugins.lsp.dap")

local keymaps_opts = { noremap = true, silent = true }

--- @type LazyPluginSpec[]
local dependencies = {
	{
		"hrsh7th/cmp-buffer",
		lazy = true,
	},
	{
		"hrsh7th/cmp-path",
		lazy = true,
	},
	{
		"hrsh7th/cmp-nvim-lsp",
		lazy = true,
	},
	dap_plugin,
	{
		"rcarriga/cmp-dap",
		lazy = true,
	},
}

local check_backspace = function()
	local col = vim.fn.col(".") - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match("%s")
end

-- POSSIBLE KINDS:
-- {
--   Parameter = 14,
--   Variable = 12,
--   Field = 11,
--   Property = 11,
--   Constant = 10,
--   Enum = 10,
--   EnumMember = 10,
--   Event = 10,
--   Function = 10,
--   Method = 15,
--   Operator = 10,
--   Reference = 10,
--   Struct = 10,
--   File = 8,
--   Folder = 8,
--   Class = 5,
--   Color = 5,
--   Module = 5,
--   Keyword = 2,
--   Constructor = 1,
--   Interface = 1,
--   Snippet = 0,
--   Text = 1,
--   TypeParameter = 1,
--   Unit = 1,
--   Value = 1,
-- }

local kind_icons = {
	Array = "",
	Boolean = "",
	Class = "",
	Color = "",
	Constant = "",
	Constructor = "",
	Enum = "",
	EnumMember = "",
	Event = "",
	Field = "",
	File = "",
	Folder = "󰉋",
	Function = "",
	Interface = "",
	Key = "",
	Keyword = "",
	Method = "",
	Module = "",
	Namespace = "",
	Null = "󰟢",
	Number = "",
	Object = "",
	Operator = "",
	Package = "",
	Property = "",
	Reference = "",
	Snippet = "",
	String = "",
	Struct = "",
	Text = "",
	TypeParameter = "",
	Unit = "",
	Value = "",
	Variable = "",
}

local lspkind_comparator = function(conf)
	local lsp_types = require("cmp.types").lsp
	return function(entry1, entry2)
		if entry1.source.name ~= "nvim_lsp" then
			if entry2.source.name == "nvim_lsp" then
				return false
			else
				return nil
			end
		end
		local kind1 = lsp_types.CompletionItemKind[entry1:get_kind()]
		local kind2 = lsp_types.CompletionItemKind[entry2:get_kind()]
		if kind1 == "Variable" and entry1:get_completion_item().label:match("%w*=") then
			kind1 = "Parameter"
		end
		if kind2 == "Variable" and entry2:get_completion_item().label:match("%w*=") then
			kind2 = "Parameter"
		end

		local priority1 = conf.kind_priority[kind1] or 0
		local priority2 = conf.kind_priority[kind2] or 0
		if priority1 == priority2 then
			return nil
		end
		return priority2 < priority1
	end
end

local setup_cmp = function(kind_comparator)
	local cmp = require("cmp")
	cmp.setup({
		enabled = function()
			return vim.api.nvim_buf_get_option(0, "buftype") ~= "prompt" or require("cmp_dap").is_dap_buffer()
		end,
		mapping = {
			-- Accept currently selected item. If none selected, `select` first item.
			-- Set `select` to `false` to only confirm explicitly selected items.
			["<CR>"] = cmp.mapping.confirm({ select = true }),
			["<Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_next_item()
				elseif check_backspace() then
					fallback()
				else
					fallback()
				end
			end, {
				"i",
				"s",
			}),
			["<S-Tab>"] = cmp.mapping(function(fallback)
				if cmp.visible() then
					cmp.select_prev_item()
				else
					fallback()
				end
			end, {
				"i",
				"s",
			}),
		},
		formatting = {
			fields = { "kind", "abbr", "menu" },
			max_width = 0,
			format = function(entry, vim_item)
				vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
				vim_item.menu = ({
					nvim_lsp = "[LSP]",
					path = "[Path]",
					buffer = "[Buffer]",
				})[entry.source.name]
				return vim_item
			end,
		},
		sources = {
			{ name = "nvim_lsp", priority = 10 },
			{ name = "path", priority = 9 },
			{ name = "buffer", priority = 0 },
		},
		sorting = {
			comparators = {
				lspkind_comparator({
					kind_priority = kind_comparator,
				}),
				cmp.config.compare.offset,
				cmp.config.compare.exact,
				cmp.config.compare.score,
				cmp.config.compare.recently_used,
				cmp.config.compare.locality,
				cmp.config.compare.kind,
				cmp.config.compare.sort_text,
				cmp.config.compare.length,
				cmp.config.compare.order,
			},
		},
		confirm_opts = {
			behavior = cmp.ConfirmBehavior.Replace,
			select = false,
		},
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},
		experimental = {
			ghost_text = false,
			native_menu = false,
		},
	})
end

-- TODO: Add support for snippets;
--- @type LazyPluginSpec
return {
	"hrsh7th/nvim-cmp",
	dependencies = dependencies,
	config = function(_, _)
		-- Setup cmp with default lsp completion comparator
		setup_cmp({})
		require("cmp").setup.filetype({ "dap-repl", "dapui_watches", "dapui_hover" }, {
			sources = {
				{ name = "dap" },
			},
		})

		-- Setting different keymaps for different cmp sorting
		-- This is very useful, when you explore an unknown object and
		-- you want to see the functions first, or the variables first, etc.

		-- CMP function ; sort lsp completion with functions being at the top
		vim.keymap.set("n", "<leader>cmpf", function()
			setup_cmp({
				Method = 2,
				Function = 1,
			})
		end, keymaps_opts)

		-- CMP variable ; sort lsp completion with variables being at the top
		vim.keymap.set("n", "<leader>cmpv", function()
			setup_cmp({
				Parameter = 2,
				Variable = 1,
			})
		end, keymaps_opts)

		-- CMP default ; sort lsp completion with default priority
		vim.keymap.set("n", "<leader>cmpd", function()
			setup_cmp({})
		end, keymaps_opts)
	end,
}
