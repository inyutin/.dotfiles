local keymap = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

---@alias vimMode "'n'" | "'i'" | "'v'" | "'x'" | "'s'" | "'o'" | "'t'" | "'c'" | "'l'" | "'!'"

--- @param mode vimMode
--- @param key string
--- @param command string
return function(mode, key, command)
	keymap(mode, key, command, opts)
end
