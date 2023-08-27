--- @return LspLanguage
local function get_python_language()
	local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

	---@type LspLanguage
	local python_language = {
		lsp_servers = {
			pyright = {
				capabilities = capabilities,
				filetypes = { "python" },
				pyright = { autoImportCompletion = true, },
				python = {
					analysis = {
						autoSearchPaths = true,
						diagnosticMode = 'openFilesOnly',
						useLibraryCodeForTypes = true,
						typeCheckingMode = 'basic'
					}
				}
			},
		},
		formatting_servers = {},
	}
	return python_language
end

return get_python_language
