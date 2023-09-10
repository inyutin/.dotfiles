--- @return LspLanguage
local function get_python_language()
	local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

	Neoconf = require("neoconf")
	local neoconf_defaults = { rootDir = nil }
	local function get_root_dir(startpath)
		local pyright_settings = Neoconf.get("pyright", neoconf_defaults)
		local root_dir = pyright_settings.rootDir
		if root_dir ~= nil then
			return root_dir
		end
		for _, pattern in ipairs({ "pyrightconfig.json", "pyproject.toml" }) do
			root_dir = require("lspconfig").util.root_pattern(pattern)(startpath)
			if root_dir ~= nil then
				return root_dir
			end
		end
	end

	--- @type LspLanguage
	local python_language = {
		lsp_servers = {
			pyright = {
				root_dir = get_root_dir,
				capabilities = capabilities,
				filetypes = { "python" },
				pyright = { autoImportCompletion = true },
			},
		},
		formatting_servers = {},
	}
	return python_language
end

return get_python_language
