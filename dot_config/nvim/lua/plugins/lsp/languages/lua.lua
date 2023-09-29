local shared_on_attach = require('plugins.lsp.languages.shared.on_attach')

--- @return LspLanguage
local function get_lua_language()
  local lua_lsp_settings = {
    on_attach = shared_on_attach,
    settings = {
      Lua = {
        workspace = {
          checkThirdParty = false,
        },
        completion = {
          callSnippet = "Replace",
        },
      },
      hint = {
        enable = true,
        typeChecking = true,
        paramName = true,
        paramType = true,
        paramDoc = true,
        usage = true,
        checks = true,
        deprecated = true,
        unused = true,
        enableTelemetry = true,
      },
      format = { enable = true },
    },
  }

  --- @type LspLanguage
  local lua_language = {
    lsp_servers = {
      lua_ls = lua_lsp_settings,
    },
    null_ls_sources = {}
  }
  return lua_language
end

return get_lua_language
