-- TODO: add other options
-- TODO: lua formats with huge indents (?), fix it
local lua_lsp_settings = {
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
		format = {
			enable = true,
			defaultConfig = {
				indent_style = "space",
				indent_size = "2",
			}
		},
	},
}

--- @type LspLanguage
local lua_language = {
	name = "lua",
	lsp_servers = {
		lua_ls = lua_lsp_settings,
	},
	formatting_servers = {
		['lua_ls'] = { 'lua' },
	},
}
return lua_language
