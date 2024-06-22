--- @type LazyPluginSpec
local precognition_plugin = {
  "tris203/precognition.nvim",
  event = "VeryLazy",
  opts = {
    startVisible = false,
  },
  keys = {
    { "<leader>tp", "<cmd>Precognition toggle<CR>", desc = "Toggle precognition" },
  }
}
return precognition_plugin
