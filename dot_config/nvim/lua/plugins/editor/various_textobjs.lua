--- @type LazyPluginSpec
local various_textobjs_plugin = {
  "chrisgrieser/nvim-various-textobjs",
  lazy = false,
  commit = "eba7c5d09c97ac8a73bad5793618b7d376d91048",
  opts = { useDefaultKeymaps = false },
  config = function(_, opts)
    require('various-textobjs').setup(opts)
    vim.keymap.set({ "o", "x" }, 'iS', "<cmd>lua require('various-textobjs').subword('inner')<CR>")
    vim.keymap.set({ "o", "x" }, 'aS', "<cmd>lua require('various-textobjs').subword('outer')<CR>")
  end,
}
return various_textobjs_plugin
