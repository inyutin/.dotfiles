local shared_on_attach = require("plugins.lsp.languages.shared.on_attach")

--- @return LspLanguage
local function get_nix_language()
	--- @type LspLanguage
	local lua_language = {
		lsp_servers = {
			nixd = {
				on_attach = shared_on_attach,
			},
		},
		conform_setup = {
			formatters = {},
			formatters_by_ft = {
				nix = { "alejandra" },
			},
		},
	}
	return lua_language
end

return get_nix_language
