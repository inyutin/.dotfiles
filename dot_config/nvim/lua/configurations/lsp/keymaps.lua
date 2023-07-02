local toggle_modes = {'n'}
local mappings = {
	{toggle_modes, 'gd', function() vim.lsp.buf.definition() end }
}
for _, mapping in ipairs(mappings) do
  vim.keymap.set(mapping[1], mapping[2], mapping[3], opts)
end
