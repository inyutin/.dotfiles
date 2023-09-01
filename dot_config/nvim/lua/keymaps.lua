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

-- Navigate buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>", opts)
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", opts)
vim.keymap.set("n", "<S-x>", ":Bdelete<CR>", opts)

-- Nvimtree
vim.keymap.set("n", "<leader>e", ":NvimTreeToggle<cr>", opts)
vim.keymap.set("n", "<C-n>", ":NvimTreeToggle<cr>", opts)

-- Telescope
vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", opts)
vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", opts)
vim.keymap.set("n", "<leader>fr", "<cmd>Telescope resume<cr>", opts)
vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", opts)

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

-- vim.keymap.set("n", "<leader>fd", find_directory_and_focus, opts)
vim.keymap.set("n", "fd", find_directory_and_focus)

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
