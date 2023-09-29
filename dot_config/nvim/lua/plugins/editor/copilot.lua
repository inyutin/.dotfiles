-- TODO: set up as cmp
--- @type LazyPluginSpec
local copilot_plugin = {
  "zbirenbaum/copilot.lua",
  event = "VeryLazy",
  commit = "2c942f33ba5c621c906e625e00a1bb504b65e2f0",
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
      ["*"] = true,
    },
  },
}
return copilot_plugin
