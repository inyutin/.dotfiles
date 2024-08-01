return function(client, bufnr)
  vim.bo[bufnr].omnifunc = "v:lua.vim.lsp.omnifunc"

  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)

  -- Open floating windon to show diagnostic
  vim.keymap.set("n", "<leader>vd", vim.diagnostic.open_float, bufopts)

	local function toggle_inlay_hints()
		if vim.g.inlay_hints_visible then
			vim.g.inlay_hints_visible = false
      vim.lsp.inlay_hint.enable(false, nil)
		else
      if client.server_capabilities.inlayHintProvider then
				vim.g.inlay_hints_visible = true
        vim.lsp.inlay_hint.enable(true, nil)
			end
		end
	end
	vim.keymap.set("n", "<leader>vh", toggle_inlay_hints, bufopts)
end
