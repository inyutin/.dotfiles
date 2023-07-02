-- use this table to disable/enable filetypes
vim.g.copilot_filetypes = { xml = false }

-- since most are enabled by default you can turn them off
-- using this table and only enable for a few filetypes
-- vim.g.copilot_filetypes = { ["*"] = false, python = true }

--imap <silent><script><expr> <C-a> copilot#Accept("\<CR>")
vim.g.copilot_no_tab_map = true
-- vim.keymap.set("n", "<A-a>", ":Copilot#Accept('\\<CR>')<CR>", { silent = true })
-- vim.keymap.set("i", "<A-a>", ":copilot#Accept('\\<CR>')<CR>", { silent = true })
vim.api.nvim_set_keymap('i', '<A-a>', 'copilot#Accept("<CR>")', {expr=true, silent=true})

-- <C-]>                   Dismiss the current suggestion.
-- <Plug>(copilot-dismiss)
--
--                                                 *copilot-i_ALT-]*
-- <M-]>                   Cycle to the next suggestion, if one is available.
-- <Plug>(copilot-next)
--
--                                                 *copilot-i_ALT-[*
-- <M-[>                   Cycle to the previous suggestion.
-- <Plug>(copilot-previous)


vim.cmd[[highlight CopilotSuggestion guifg=#555555 ctermfg=8]]
