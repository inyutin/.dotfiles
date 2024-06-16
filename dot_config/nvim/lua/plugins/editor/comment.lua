--- @type LazyPluginSpec
local comment_plugin = {
  'numToStr/Comment.nvim',
  lazy = true,
  event = "VeryLazy",
  keys = {
    'gc',
    'gb',
    'gcc',
    'gcb',
    { "gc", mode = "v", id = "gc" },
    { "gb", mode = "v", id = "gb" },
  },
  opts = {
    padding = true,
    sticky = true,
    toggler = {
      line = 'gcc',
      block = 'gbc',
    },
    opleader = {
      line = 'gc',
      block = 'gb',
    },
    ---LHS of extra mappings
    extra = {
      above = 'gcO',
      below = 'gco',
      eol = 'gcA',
    },
    mappings = {
      basic = true,
      extra = true,
    },
  },
}

--- @type LazyPluginSpec[]
return {
  comment_plugin,
}
