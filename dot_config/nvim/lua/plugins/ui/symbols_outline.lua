--- @type LazyPluginSpec
local symbols_outline_plugin = {
  'simrat39/symbols-outline.nvim',
  commit = "512791925d57a61c545bc303356e8a8f7869763c",
  event = "VeryLazy",
  opts = {
    show_relative_numbers = true,
    keymaps = { -- These keymaps can be a string or a table for multiple keys
      close = { "q" },
      goto_location = "<Cr>",
      focus_location = "o",
      hover_symbol = "H",
      toggle_preview = "K",
      rename_symbol = nil,
      code_actions = nil,
      fold = "h",
      unfold = "l",
      fold_all = "W",
      unfold_all = "E",
      fold_reset = "R",
    },
  },
  config = function(_, opts)
    require('symbols-outline').setup(opts)
    vim.keymap.set('n', '<leader>to', ":SymbolsOutline<CR>")
  end,
  keys = {
    "n",
    "<leader>to",
  },
}
return symbols_outline_plugin
