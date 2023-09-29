local ensure_installed = {
  "python",
  "dockerfile",
  "markdown",
  "bash",
  "lua",
}

--- @type LazyPluginSpec
local treesitter_plugin = {
  "nvim-treesitter/nvim-treesitter",
  commit = "d94e1ad9575cc211b5726f09b28ca9454aba22fe",
  build = ":TSUpdate",
  config = function(_, _)
    local configs = require("nvim-treesitter.configs")
    configs.setup({
      modules = {},
      ensure_installed = ensure_installed,
      sync_install = false,
      auto_install = false,
      ignore_install = { "" },
      highlight = {
        enable = true,
        disable = {}, -- list of language that will be disabled
        additional_vim_regex_highlighting = false,
      },
    })
  end,
}

-- TODO: how to load this lazily?
--- @type LazyPluginSpec
local treesitter_context_plugin = {
  "nvim-treesitter/nvim-treesitter-context",
  commit = "3e7c60982c98a9f5e7b6b0fb7c9ba5318f752fe1",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  opts = {
    enable = false,
    max_lines = 0,
    min_window_height = 0,
    line_numbers = true,
    multiline_threshold = 20,
    trim_scope = 'outer',
    mode = 'cursor',
    separator = nil,
    zindex = 20,
    on_attach = nil,
  },
  config = function(_, opts)
    local ts_context = require("treesitter-context")
    ts_context.setup(opts)
    vim.keymap.set("n", "<leader>C", ":TSContextToggle<cr>")
  end,
}

--- @type LazyPluginSpec[]
return {
  treesitter_plugin,
  treesitter_context_plugin,
}
