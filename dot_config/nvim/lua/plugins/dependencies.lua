-- Common dependencies used by lots of plugins
--- @type LazyPluginSpec[]
return {
  {
    "nvim-lua/plenary.nvim",
    lazy = false,
    priority = 1000,
  },
  {
    'nvim-tree/nvim-web-devicons',
    lazy = false,
    priority = 1000,
  },
  {
    "nvim-neotest/nvim-nio",
    priority = 1000,
    lazy = false,
  },
  {
    "nvim-lua/popup.nvim",
    lazy = false,
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    priority = 999,
  },
  {
    'junegunn/fzf',
    build = function()
      vim.fn['fzf#install']()
    end
  }
}
