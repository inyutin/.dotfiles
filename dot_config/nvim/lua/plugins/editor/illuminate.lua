--- @type LazyPluginSpec
local illuminate_plugin = {
  "RRethy/vim-illuminate",
  opts = {
    providers = {
      'lsp',
      'treesitter',
    },
    delay = 0,
    min_count_to_highlight = 1,
  },
  config = function(_, opts)
    require('illuminate').configure(opts)

    vim.keymap.set("n", "<C-n>", function()
      require("illuminate").goto_next_reference()
    end)
    vim.keymap.set("n", "<C-p>", function()
      require("illuminate").goto_prev_reference()
    end)
    vim.keymap.set("n", "gi", function()
      require('illuminate').toggle_freeze_buf()
    end)
  end,
}
return illuminate_plugin
