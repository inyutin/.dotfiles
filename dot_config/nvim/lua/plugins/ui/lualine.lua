--- @type LazyPluginSpec
local gitblame_plugin = {
	"f-person/git-blame.nvim",
	commit = "41e22dc843c6821a410db57be0b7025154f9d8ec",
	config = function(_, _)
		vim.g.gitblame_display_virtual_text = 0
	end,
}


local function get_lualine_opts()
	local git_blame = require('gitblame')
	return {
		options = {
			icons_enabled = true,
			theme = 'auto',
			component_separators = { left = '', right = '' },
			section_separators = { left = '', right = '' },
			disabled_filetypes = { 'NvimTree' },
			ignore_focus = {},
			always_divide_middle = true,
			globalstatus = false,
			refresh = {
				statusline = 1000,
				tabline = 1000,
				winbar = 1000,
			}
		},
		sections = {
			lualine_a = { 'mode' },
			lualine_b = { 'branch', 'diff', 'diagnostics' },
			lualine_c = {
				{
					'filename',
					file_status = true, -- Displays file status (readonly status, modified status)
					newfile_status = false, -- Display new file status (new file means no write after created)
					path = 1,
					shorting_target = 40, -- Shortens path to leave 40 spaces in the window
					symbols = {
						modified = '[+]',
						readonly = '[-]',
						unnamed = '[No Name]',
						newfile = '[New]',
					},
				},
			},
			lualine_x = {
				{ git_blame.get_current_blame_text, cond = git_blame.is_blame_text_available }
			},
			lualine_y = { 'filetype' },
			lualine_z = { 'location' }
		},
		inactive_sections = {
			lualine_a = {},
			lualine_b = {},
			lualine_c = { 'filename' },
			lualine_x = { 'location' },
			lualine_y = {},
			lualine_z = {}
		},
		tabline = {},
		winbar = {},
		inactive_winbar = {},
		extensions = {}
	}
end


--- @type LazyPluginSpec
local lualine_plugin = {
	'nvim-lualine/lualine.nvim',
	commit = "45e27ca739c7be6c49e5496d14fcf45a303c3a63",
	dependencies = {
		"nvim-tree/nvim-web-devicons",
		gitblame_plugin,
	},
	opts = get_lualine_opts,
}
return lualine_plugin
