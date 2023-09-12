--- @type LazyPluginSpec
local harpoon_plugin = {
	'ThePrimeagen/harpoon',
	commit = "21f4c47c6803d64ddb934a5b314dcb1b8e7365dc",
	event = "VeryLazy",
	config = function(_, opts)
		require("harpoon").setup(opts)

		vim.keymap.set("n", "<leader>ha", function() require("harpoon.mark").add_file() end)
		vim.keymap.set("n", "<leader>hl", function() require("harpoon.ui").toggle_quick_menu() end)

		vim.keymap.set("n", "<C-w>", function() require("harpoon.ui").nav_next() end)
		vim.keymap.set("n", "<C-q>", function() require("harpoon.ui").nav_prev() end)

		for var = 1, 9 do
			local key = "<leader>h" .. var
			vim.keymap.set("n", key, function() require("harpoon.ui").nav_file(var) end)
		end
	end,
}
return harpoon_plugin
