--- @type LazyPluginSpec
local lsp_signature_plugin = {
  "ray-x/lsp_signature.nvim",
  event = "VeryLazy",
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
