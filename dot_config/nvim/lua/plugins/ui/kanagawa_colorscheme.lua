--- @type LazyPluginSpec
local kanagawa_colorscheme_plugin = {
  "rebelot/kanagawa.nvim",
  commit = "0a24e504a3a278849ad0aef31cd6dd24c73ca3db",
  opts = {
    compile = false,
    undercurl = true,
    commentStyle = { italic = true },
    functionStyle = {},
    keywordStyle = { italic = true },
    statementStyle = { bold = true },
    typeStyle = {},
    variablebuiltinStyle = { italic = true },
    specialReturn = true,
    specialException = true,
    transparent = false,
    dimInactive = false,
    globalStatus = false,
    terminalColors = true,
    colors = {},
    theme = "dragon",
    overrides = function(colors)
      local theme = colors.theme
      local illuminate_color_setup = { fg = theme.syn.special2, bg = theme.ui.bg_p1, bold = true }
      return {
        IlluminatedWordText = illuminate_color_setup,
        IlluminatedWordRead = illuminate_color_setup,
        IlluminatedWordWrite = illuminate_color_setup,
      }
    end,
  },
  priority = 500, -- load after all other plugins, this is recommended
  config = function(_, opts)
    require("kanagawa").setup(opts)
    require("kanagawa").load("dragon")
  end,
}
return kanagawa_colorscheme_plugin
