--- @type LazyPluginSpec
local nvim_window_picker = {
	's1n7ax/nvim-window-picker',
	name = 'window-picker',
	event = 'VeryLazy',
	tag = "v2.0.2",
	opts = {
		hint = 'floating-big-letter',
		selection_chars = 'FJDKSLA;CMRUEIWOQP',
		picker_config = {
			floating_big_letter = {
				font = 'ansi-shadow', -- ansi-shadow |
			},
		},
		show_prompt = true,
		prompt_message = 'Pick window: ',
		filter_rules = {
			autoselect_one = false,
			include_current_win = true,
			bo = {
				-- if the file type is one of following, the window will be ignored
				filetype = { 'NvimTree', 'notify' },
			},
		},
	},
	config = function(_, opts)
		local window_picker = require('window-picker')
		window_picker.setup(opts)

		local function focus_window()
			local window = window_picker.pick_window({
				filter_rules = {
					bo = { filetype = { 'notify' } },
				},
			})
			if window ~= nil then
				vim.api.nvim_set_current_win(window)
			end
		end

		local function close_window()
			local window = window_picker.pick_window()
			if window ~= nil then
				vim.api.nvim_win_close(window, false)
			end
		end

		vim.keymap.set('n', '<leader><leader>s', focus_window)
		vim.keymap.set('n', '<leader><leader>x', close_window)
	end,
	keys = {
		'<leader><leader>s',
		'<leader><leader>x',
	},
}
return nvim_window_picker
