-- Common dependencies used by lots of plugins
--- @type LazyPluginSpec[]
return {
  {
    "nvim-lua/plenary.nvim",
    commit = "0232372b906f275f76ac42029eba25eaf95e76b9",
    lazy = false,
    priority = 1000,
  },
  {
    'nvim-tree/nvim-web-devicons',
    commit = "ecdeb4e2a4af34fc873bbfbf1f4c4e447e632255",
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
    commit = "b7404d35d5d3548a82149238289fa71f7f6de4ac",
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
