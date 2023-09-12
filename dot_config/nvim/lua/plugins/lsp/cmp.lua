--- @type LazyPluginSpec[]
local dependencies = {
	{
		"hrsh7th/cmp-buffer",
		commit = "3022dbc9166796b644a841a02de8dd1cc1d311fa",
		lazy = true,
	},
	{
		"hrsh7th/cmp-path",
		commit = "91ff86cd9c29299a64f968ebb45846c485725f23",
		lazy = true,
	},
	{
		"hrsh7th/cmp-cmdline",
		commit = "8ee981b4a91f536f52add291594e89fb6645e451",
		lazy = true,
	},
	{
		"hrsh7th/cmp-nvim-lsp",
		commit = "44b16d11215dce86f253ce0c30949813c0a90765",
		lazy = true,
	},
	{
		"hrsh7th/cmp-nvim-lsp-signature-help",
		commit = "3d8912ebeb56e5ae08ef0906e3a54de1c66b92f1",
		lazy = true,
	},
}

local check_backspace = function()
	local col = vim.fn.col "." - 1
	return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end

local kind_icons = {
	Text = "",
	Method = "m",
	Function = "",
	Constructor = "",
	Field = "",
	Variable = "",
	Class = "",
	Interface = "",
	Module = "",
	Property = "",
	Unit = "",
	Value = "",
	Enum = "",
	Keyword = "",
	Color = "",
	File = "",
	Reference = "",
	Folder = "",
	EnumMember = "",
	Constant = "",
	Struct = "",
	Event = "",
	Operator = "",
	TypeParameter = "",
}

-- TODO: Add support for snippets; generally improve the completion experience
--- @type LazyPluginSpec
return {
	-- CMP	
	"hrsh7th/nvim-cmp",
	commit = "5dce1b778b85c717f6614e3f4da45e9f19f54435",
	dependencies = dependencies,
	config = function(_, _)
		local cmp = require("cmp")
		cmp.setup {
			mapping = {
				-- Accept currently selected item. If none selected, `select` first item.
				-- Set `select` to `false` to only confirm explicitly selected items.
				["<CR>"] = cmp.mapping.confirm { select = true },
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
				format = function(entry, vim_item)
					-- Kind icons
					-- vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
					vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
					vim_item.menu = ({
						nvim_lsp = "[LSP]",
						buffer = "[Buffer]",
						path = "[Path]",
					})[entry.source.name]
					return vim_item
				end,
			},
			sources = {
				{ name = "nvim_lsp_signature_help" },
				{ name = "nvim_lsp" },
				{ name = "buffer" },
				{ name = "path" },
			},
			confirm_opts = {
				behavior = cmp.ConfirmBehavior.Replace,
				select = false,
			},
			window = {
				documentation = cmp.config.window.bordered(),
			},
			experimental = {
				ghost_text = false,
				native_menu = false,
			},
		}
	end,
}
