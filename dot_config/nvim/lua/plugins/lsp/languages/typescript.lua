--- @return LspLanguage
local function get_typescript_language()
  --- @type LspLanguage
  local typescript_language = {
    lsp_servers = {
      tsserver = {}
    },
    conform_setup = {
      formatters = {},
      formatters_by_ft = {},
    },
  }
  return typescript_language
end

return get_typescript_language
