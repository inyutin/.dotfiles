local shared_on_attach = require("plugins.lsp.languages.shared.on_attach")

--- @return LspLanguage
local function get_nix_language()
	--- @return LspLanguage
	local language = {
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
	return language
end

return get_nix_language
