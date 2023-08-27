local get_lua_language = require('plugins.lsp.languages.lua')
local get_python_language = require('plugins.lsp.languages.python')
local get_typescript_language = require('plugins.lsp.languages.typescript')

---@type (fun(): LspLanguage)[]
local languages = {
	get_lua_language,
	get_python_language,
	get_typescript_language,
}

---@return table<string, table>
local function get_all_lsp_servers()
	---@type table<string, table>
	local res = {}
	for language_count = 1, #languages do
		local language = languages[language_count]()
		for k, v in pairs(language.lsp_servers) do
			res[k] = v
		end
	end
	return res
end

---@return table<string, table>
local function get_all_formatting_servers()
	---@type table<string, table>
	local res = {}
	for language_count = 1, #languages do
		local language = languages[language_count]()
		for k, v in pairs(language.formatting_servers) do
			res[k] = v
		end
	end
	return res
end

---@return string[]
local function get_all_lsp_server_names()
	---@type string[]
	local res = {}
	for language_count = 1, #languages do
		local language = languages[language_count]()
		for k, _ in pairs(language.lsp_servers) do
			table.insert(res, k)
		end
	end
	return res
end

return {
	languages = languages,
	get_all_lsp_servers = get_all_lsp_servers,
	get_all_formatting_servers = get_all_formatting_servers,
	get_all_lsp_server_names = get_all_lsp_server_names,
}
