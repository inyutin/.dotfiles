--- @type LazyPluginSpec
local stickybuf_plugin = {
  'stevearc/stickybuf.nvim',
  opts = {
    -- This function is run on BufEnter to determine pinning should be activated
    get_auto_pin = function(bufnr)
      return require("stickybuf").should_auto_pin(bufnr)
    end
  },
}
return stickybuf_plugin
