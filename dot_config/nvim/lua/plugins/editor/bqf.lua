--- @type LazyPluginSpec
local bqf_plugin = {
  "kevinhwang91/nvim-bqf",
  ft = 'qf',
  opts = {
    preview = {
      winblend = 0,
    },
    func_map = {
      vsplit = '<leader>sv',
      split = '<leader>sx',
    },
  }
}
return bqf_plugin
