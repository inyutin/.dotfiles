--- @type LazyPluginSpec
local aerial_plugin = {
  'stevearc/aerial.nvim',
  event = "VeryLazy",
  commit = "551a2b679f265917990207e6d8de28018d55f437",
  opts = {
    filter_kind = false,
    layout = {
      placement = "edge",
    },
    attach_mode = "global",
  },
  config = function(_, opts)
    require('aerial').setup(opts)
    vim.keymap.set('n', '<leader>to', ":AerialToggle!<CR>")
  end,
}

return aerial_plugin
