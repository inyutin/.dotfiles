local opts = { noremap = true, silent = true }

-- Shorten function name
--Remap space as leader key
vim.keymap.set("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

-- NORMAL MODE --
-- Enter visual block mode; # TODO: find a better command
vim.keymap.set("n", "<A-v>", "<C-v>", opts)
vim.keymap.set("n", "<C-s>", ":update<cr>", opts)

-- Better window navigation
vim.keymap.set("n", "<C-Left>", "<C-w>h", opts)
vim.keymap.set("n", "<C-Down>", "<C-w>j", opts)
vim.keymap.set("n", "<C-Up>", "<C-w>k", opts)
vim.keymap.set("n", "<C-Right>", "<C-w>l", opts)

-- Resize with arrows
vim.keymap.set("n", "<C-S-Up>", ":resize +2<CR>", opts)
vim.keymap.set("n", "<C-S-Down>", ":resize -2<CR>", opts)
vim.keymap.set("n", "<C-S-Left>", ":vertical resize -2<CR>", opts)
vim.keymap.set("n", "<C-S-Right>", ":vertical resize +2<CR>", opts)

-- LSP
vim.keymap.set("n", "rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

-- INSERT MODE --
vim.keymap.set("i", "<C-s>", ":update<cr>", opts)

-- VISUAL MODE --
-- Stay in indent mode
vim.keymap.set("v", "<", "<gv", opts)
vim.keymap.set("v", ">", ">gv", opts)

-- Move text up and down
vim.keymap.set("v", "<A-Up>", ":m .+1<CR>==", opts)
vim.keymap.set("v", "<A-Down>", ":m .-2<CR>==", opts)
vim.keymap.set("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
vim.keymap.set("x", "<A-Up>", ":move '>+1<CR>gv-gv", opts)
vim.keymap.set("x", "<A-Down>", ":move '<-2<CR>gv-gv", opts)

vim.keymap.set('n', 'do', vim.diagnostic.open_float, opts)
