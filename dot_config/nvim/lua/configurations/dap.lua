require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')

require('dap-python').test_runner = 'pytest'

require('dap').configurations.python = {
	{
		name = "Pytest: Current File",
		type = "python",
		request = "launch",
		module = "pytest",
		args = {
			"${file}",
			"-sv",
			"--log-cli-level=INFO",
			"--log-file=test_out.log"
		},
		-- console= "integratedTerminal",
		-- console= "externalTerminal",
		console = "internalConsole",
	}
}

require('dap').defaults.fallback.external_terminal = {
	command = '/usr/bin/alacritty',
	args = { '-e' },
}

local opts = { noremap = true, silent = true }
local keymap = vim.api.nvim_set_keymap

vim.keymap.set('n', '<Leader>1', function() require('dap').continue() end)
vim.keymap.set('n', '<Leader>2', function() require('dap').step_over() end)
vim.keymap.set('n', '<Leader>3', function() require('dap').step_into() end)
vim.keymap.set('n', '<Leader>4', function() require('dap').step_out() end)
vim.keymap.set('n', '<Leader>b', function() require('dap').toggle_breakpoint() end)
-- vim.keymap.set('n', '<Leader>B', function() require('dap').set_breakpoint() end)
-- vim.keymap.set('n', '<Leader>lp', function() require('dap').set_breakpoint(nil, nil, vim.fn.input('Log point message: ')) end)
vim.keymap.set('n', '<Leader>dr', function() require('dap').repl.open() end)
vim.keymap.set('n', '<Leader>dl', function() require('dap').run_last() end)
vim.keymap.set({ 'n', 'v' }, '<Leader>dh', function()
	require('dap.ui.widgets').hover()
end)
vim.keymap.set({ 'n', 'v' }, '<Leader>dp', function()
	require('dap.ui.widgets').preview()
end)
vim.keymap.set('n', '<Leader>df', function()
	local widgets = require('dap.ui.widgets')
	widgets.centered_float(widgets.frames)
end)
vim.keymap.set('n', '<Leader>ds', function()
	local widgets = require('dap.ui.widgets')
	widgets.centered_float(widgets.scopes)
end)

local dap, dapui = require("dap"), require("dapui")
dapui.setup({
	icons = { expanded = "▾", collapsed = "▸" },
	mappings = {
		open = "o",
		remove = "d",
		edit = "e",
		repl = "r",
		toggle = "t",
	},
	expand_lines = vim.fn.has("nvim-0.7"),
	layouts = {
		{
			elements = {
				"scopes",
			},
			size = 0.3,
			position = "right"
		},
		{
			elements = {
				"repl",
				"breakpoints"
			},
			size = 0.3,
			position = "bottom",
		},
	},
	floating = {
		max_height = nil,
		max_width = nil,
		border = "single",
		mappings = {
			close = { "q", "<Esc>" },
		},
	},
	windows = { indent = 1 },
	render = {
		max_type_length = nil,
	},
})
dap.listeners.after.event_initialized["dapui_config"] = function()
	dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
	dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
	dapui.close()
end

vim.keymap.set('n', '<Leader>de', function()
	require("dapui").eval()
end)
