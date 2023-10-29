--- @type LazyPluginSpec
local lsp_signature_plugin = {
  "ray-x/lsp_signature.nvim",
  event = "VeryLazy",
  commit = "33250c84c7a552daf28ac607d9d9e82f88cd0907",
  dependencies = {},
  opts = {
    bind = true,
    handler_opts = {
      border = "rounded"
    },
    noice = false,
  },
}
return lsp_signature_plugin
