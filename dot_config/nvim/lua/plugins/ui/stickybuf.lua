--- @type LazyPluginSpec
local stickybuf_plugin = {
  'stevearc/stickybuf.nvim',
  commit = "f3398f8639e903991acdf66e2d63de7a78fe708e",
  event = "BufEnter",
  config = function(_, _)
    require("stickybuf").setup()
  end,
}
return stickybuf_plugin
