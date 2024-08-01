local toggle_undotree = function()
	local nvim_tree_api = require("nvim-tree.api")
	nvim_tree_api.tree.close()
	vim.cmd("UndotreeToggle")
end

--- @type LazyPluginSpec
local undotree_plugin = {
	"mbbill/undotree",
	lazy = true,
	cmd = { "UndotreeToggle" },
	keys = {
		{ "<leader>U", toggle_undotree, desc = "Toggle undotree" },
	},
}
return undotree_plugin
