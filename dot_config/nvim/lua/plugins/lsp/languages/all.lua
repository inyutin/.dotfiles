local lua_language = require('plugins.lsp.languages.lua')

---@ type LspLanguage[]
local languages = {
	lua_language,
}

---@ return table<string, table>
local function get_all_lsp_servers()
	---@ type table<string, table>
	local res = {}
	for language_count = 1, #languages do
		local language = languages[language_count]
		for k, v in pairs(language.lsp_servers) do
			res[k] = v
		end
	end
	return res
end

---@ return table<string, table>
local function get_all_formatting_servers()
	---@ type table<string, table>
	local res = {}
	for language_count = 1, #languages do
		local language = languages[language_count]
		for k, v in pairs(language.formatting_servers) do
			res[k] = v
		end
	end
	return res
end

---@ return string[]
local function get_all_lsp_server_names()
	---@ type string[]
	local res = {}
	for language_count = 1, #languages do
		local language = languages[language_count]
		for k, _ in pairs(language.lsp_servers) do
			table.insert(res, k)
		end
	end
	return res
end

return {
	languages = languages,
	lsp_servers = get_all_lsp_servers(),
	formatting_servers = get_all_formatting_servers(),
	lsp_server_names = get_all_lsp_server_names(),
}
