-- TODO: set up as cmp
--- @type LazyPluginSpec
local copilot_plugin = {
  "zbirenbaum/copilot.lua",
  event = "VeryLazy",
  build = ":Copilot auth",
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      keymap = {
        accept = "<C-a>",
      },
    },
    panel = {
      enabled = false,
    },
    filetypes = {
      ["grug-far"] = false,
      ["grug-far-history"] = false,
      ["*"] = true,
    },
  },
}
return copilot_plugin
