--- @return LspLanguage
local function get_typescript_language()
	--- @type LspLanguage
	local typescript_language = {
		lsp_servers = {
			tsserver = {}
		},
		null_ls_sources = {},
	}
	return typescript_language
end

return get_typescript_language
