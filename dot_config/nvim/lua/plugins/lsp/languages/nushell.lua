local shared_on_attach = require('plugins.lsp.languages.shared.on_attach')

--- @return LspLanguage
local function get_nushell_language()
  --- @type LspLanguage
  local lua_language = {
    lsp_servers = {
      nushell = {},
    },
    conform_setup = {
      formatters = {},
      formatters_by_ft = {},
    },
  }
  return lua_language
end

return get_nushell_language
