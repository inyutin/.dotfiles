local shared_on_attach = require("plugins.lsp.languages.shared.on_attach")

--- @return LspLanguage
local function get_gleam_language()
	--- @type LspLanguage
	local language = {
		lsp_servers = {
			gleam = {
				on_attach = shared_on_attach,
			},
		},
		conform_setup = {
			formatters = {},
			formatters_by_ft = {
				gleam = { "gleam" },
			},
		},
	}
	return language
end

return get_gleam_language
