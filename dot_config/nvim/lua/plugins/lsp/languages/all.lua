local get_lua_language = require("plugins.lsp.languages.lua")
local get_nix_language = require("plugins.lsp.languages.nix")
local get_nushell_language = require("plugins.lsp.languages.nushell")
local get_python_language = require("plugins.lsp.languages.python")
local get_gleam_language = require("plugins.lsp.languages.gleam")

---@type (fun(): LspLanguage)[]
local languages = {
	get_lua_language,
	get_nix_language,
	get_nushell_language,
	get_python_language,
	get_gleam_language,
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

---@param ignore_servers table<string>
---@return string[]
local function get_all_lsp_server_names(ignore_servers)
	---@type string[]
	local res = {}
	for language_count = 1, #languages do
		local language = languages[language_count]()
		for name, _ in pairs(language.lsp_servers) do
			for _, ignore_server in pairs(ignore_servers) do
				if name == ignore_server then
					goto continue
				end
			end
			table.insert(res, name)
			::continue::
		end
	end
	return res
end

---@return ConformSetup
local function get_combined_conform_setup()
	---@type table<string, table>>
	local formatters = {}

	---@type table<string, Array<string>>
	local formatters_by_ft = {}

	for language_count = 1, #languages do
		local language = languages[language_count]()
		for k, v in pairs(language.conform_setup.formatters) do
			formatters[k] = v
		end
		for k, v in pairs(language.conform_setup.formatters_by_ft) do
			formatters_by_ft[k] = v
		end
	end
	return {
		formatters = formatters,
		formatters_by_ft = formatters_by_ft,
	}
end

return {
	languages = languages,
	get_all_lsp_servers = get_all_lsp_servers,
	get_all_lsp_server_names = get_all_lsp_server_names,
	get_combined_conform_setup = get_combined_conform_setup,
}
