--- @return LspLanguage
local function get_typescript_language()
	--- @type LspLanguage
	local typescript_language = {
		lsp_servers = {
			tsserver = {}
		},
		formatting_servers = {},
	}
	return typescript_language
end

return get_typescript_language
