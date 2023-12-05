--- @type LazyPluginSpec
local multiple_cursors = {
  "brenton-leighton/multiple-cursors.nvim",
  commit = "4967d41ef0b7d89eba2d0b73113c9b5a1fab4afd",
  lazy = true,
  keys = {
    { "<C-k>", "<Cmd>MultipleCursorsAddUp<CR>",   mode = { "n", "i" } },
    { "<C-j>", "<Cmd>MultipleCursorsAddDown<CR>", mode = { "n", "i" } },
  },
  opts = {}
}
return multiple_cursors
