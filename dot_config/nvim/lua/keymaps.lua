local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
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
keymap("n", "<A-v>", "<C-v>", opts)
keymap("n", "<C-s>", ":update<cr>", opts)

-- Better window navigation
keymap("n", "<C-Left>", "<C-w>h", opts)
keymap("n", "<C-Down>", "<C-w>j", opts)
keymap("n", "<C-Up>", "<C-w>k", opts)
keymap("n", "<C-Right>", "<C-w>l", opts)

-- Resize with arrows
keymap("n", "<C-S-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-S-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-S-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-S-Right>", ":vertical resize +2<CR>", opts)

-- Navigate buffers
keymap("n", "<Tab>", ":bnext<CR>", opts)
keymap("n", "<S-Tab>", ":bprevious<CR>", opts)
keymap("n", "<S-x>", ":Bdelete<CR>", opts)

-- Nvimtree
keymap("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
keymap("n", "<C-n>", ":NvimTreeToggle<cr>", opts)

-- Telescope
keymap("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
keymap("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
keymap("n", "<leader>fr", "<cmd>Telescope resume<cr>", opts)
keymap("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)

local function find_directory_and_focus()
	local actions = require("telescope.actions")
	local action_state = require("telescope.actions.state")

	local function open_nvim_tree(prompt_bufnr, _)
		actions.select_default:replace(function()
			local api = require("nvim-tree.api")

			actions.close(prompt_bufnr)
			local selection = action_state.get_selected_entry()
			api.tree.open()
			api.tree.find_file(selection.cwd .. "/" .. selection.value)
		end)
		return true
	end

	require("telescope.builtin").find_files({
		find_command = { "fdfind", "--type", "directory", "--hidden", "--exclude", ".git/*" },
		attach_mappings = open_nvim_tree,
	})
end

-- keymap("n", "<leader>fd", find_directory_and_focus, opts)
vim.keymap.set("n", "fd", find_directory_and_focus)

-- LSP
keymap("n", "rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)

-- INSERT MODE --
keymap("i", "<C-s>", ":update<cr>", opts)

-- VISUAL MODE --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-Up>", ":m .+1<CR>==", opts)
keymap("v", "<A-Down>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "<A-Up>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-Down>", ":move '<-2<CR>gv-gv", opts)
