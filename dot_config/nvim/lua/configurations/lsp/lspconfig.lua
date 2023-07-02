require("mason").setup()
require("mason-lspconfig").setup {
    ensure_installed = { "pyright" },
}

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
-- local capabilities = require('cmp_nvim_lsp').default_capabilities()

local capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

require("lspconfig").pyright.setup {
	capabilities = capabilities,
	filetypes = { "python" },
	pyright = {autoImportCompletion = true,},
	python = {
		analysis = {
			autoSearchPaths = true,
			diagnosticMode = 'openFilesOnly',
			useLibraryCodeForTypes = true,
			typeCheckingMode = 'basic'
		}
	}
}
