require('kanagawa').setup({
	undercurl = true, -- enable undercurls
	commentStyle = { italic = true },
	functionStyle = {},
	keywordStyle = { italic = true },
	statementStyle = { bold = true },
	typeStyle = {},
	variablebuiltinStyle = { italic = true },
	specialReturn = true,   -- special highlight for the return keyword
	specialException = true, -- special highlight for exception handling keywords
	transparent = false,    -- do not set background color
	dimInactive = false,    -- dim inactive window `:h hl-NormalNC`
	globalStatus = false,   -- adjust window separators highlight for laststatus=3
	terminalColors = true,  -- define vim.g.terminal_color_{0,17}
	colors = {},
	overrides = function(colors)
		local theme = colors.theme
		local illuminate_color_setup = { fg = theme.syn.special2, bg = theme.ui.bg_p1, bold = true }
		return {
			IlluminatedWordText = illuminate_color_setup,
			IlluminatedWordRead = illuminate_color_setup,
			IlluminatedWordWrite = illuminate_color_setup,
		}
	end,
	theme = "default" -- Load "default" theme or the experimental "light" theme
})

local status_ok, _ = pcall(vim.cmd, "colorscheme kanagawa-dragon")
if not status_ok then
	vim.notify("colorscheme kanagawa not found!")
	return
end

-- TODO:
-- enchance to show full path
-- remove utf-8 + penguin + lua + procents
-- put status line on ground
require('lualine').setup()
