--- @type LazyPluginSpec
local multiple_cursors = {
  "brenton-leighton/multiple-cursors.nvim",
  lazy = true,
  keys = {
    { "<C-k>", "<Cmd>MultipleCursorsAddUp<CR>",   mode = { "n", "i" } },
    { "<C-j>", "<Cmd>MultipleCursorsAddDown<CR>", mode = { "n", "i" } },
  },
  opts = {}
}
return multiple_cursors
