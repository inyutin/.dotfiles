--- @return LspLanguage
local function get_python_language()
	local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

	-- TODO: neoconf should be able to work with analysis/python parth params out of the box
	Neoconf = require("neoconf")
	local neoconf_defaults = {
		rootDir = nil,
		pythonPath = nil,
		analysis = {
			typeCheckingMode = "basic",
		},
	}
	local pyright_settings = Neoconf.get("pyright", neoconf_defaults)

	local function get_root_dir(startpath)
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

	local pyright_python_settings = {
		analysis = pyright_settings.analysis,
	}
	if pyright_settings.pythonPath ~= nil then
		pyright_python_settings.pythonPath = pyright_settings.pythonPath
	end

	--- @type LspLanguage
	local python_language = {
		lsp_servers = {
			pyright = {
				root_dir = get_root_dir,
				capabilities = capabilities,
				filetypes = { "python" },
				settings = {
					python = pyright_python_settings,
				},
			},
		},
		formatting_servers = {},
	}
	return python_language
end

return get_python_language
