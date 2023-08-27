require("bufferline").setup {
	options = {
		diagnostics = false,
		color_icons = false,
		show_buffer_icons = false,
		offsets = { { filetype = "NvimTree", text = "File Explorer", padding = 1, separator = true } },
		--		groups = {  # TODO: ? need to set up order
		--			options = {
		--				toggle_hidden_on_enter = true -- when you re-enter a hidden group this options re-opens that group so the buffer is visible
		--			},
		--			items = {
		--				{
		--					name = "Tests", -- Mandatory
		--					highlight = {underline = true, sp = "blue"}, -- Optional
		--					priority = 2, -- determines where it will appear relative to other groups (Optional)
		--					icon = "", -- Optional
		--					matcher = function(buf) -- Mandatory
		--						return buf.filename:match('test')
		--					end,
		--				},
		--			}
		--		}
	},
}
