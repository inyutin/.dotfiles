-- :help options or :help <option_name>; F.E :help number

local opt = vim.opt

-- disable netrw at the very start of your init.lua (strongly advised)
-- to support nvim tree
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

opt.shell = "/usr/bin/fish"   -- set shell to fish
opt.backup = false            -- creates a backup file
opt.clipboard = "unnamedplus" -- allows neovim to access the system clipboard
opt.cmdheight = 2             -- more space in the neovim command line for displaying messages
opt.conceallevel = 0          -- so that `` is visible in markdown files
opt.fileencoding = "utf-8"    -- the encoding written to a file
opt.fillchars = { eob = " " }
opt.hlsearch = false          -- don't highlight all matches on previous search pattern
opt.ignorecase = true         -- ignore case in search patterns
opt.mouse = "a"               -- allow the mouse to be used in neovim
opt.number = true             -- set numbered lines
opt.numberwidth = 4           -- set number column width to 2 {default 4}
opt.showmode = false          -- we don't need to see things like -- INSERT -- anymore
opt.pumheight = 10            -- pop up menu height
opt.relativenumber = true     -- set relative numbered lines
opt.scrolloff = 8             -- min amount of lines to show below current line
opt.shiftwidth = 2            -- the number of spaces inserted for each indentation
opt.shortmess:append "c"      -- don't show ins-completion-menu messages.
opt.showtabline = 2           -- always show editor tabs
opt.sidescrolloff = 8         -- same	as ^
opt.signcolumn = "yes"        -- always show the sign column, otherwise it would shift the text each time
opt.smartcase = true          -- smart case
opt.smartindent = true        -- make indenting smarter again
opt.softtabstop = 2
opt.splitbelow = true         -- force all horizontal splits to go below current window
opt.splitright = true         -- force all vertical splits to go to the right of current window
opt.swapfile = false          -- creates a swapfile
opt.tabstop = 2
opt.termguicolors = true      -- set term gui colors (most terminals support this)
opt.timeoutlen = 1000         -- time to wait for a mapped sequence to complete (in milliseconds)
opt.title = false             -- don't show title, the file name appears in status line -- TODO
opt.undofile = true           -- enable persistent undo
opt.updatetime = 300          -- faster completion (4000ms default)
opt.wrap = true               -- wrap lines
opt.writebackup = false       -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited

-- go to previous/next line with h,l,left arrow and right arrow
-- when cursor reaches end/beginning of line
opt.whichwrap:append "<>[]hl"
opt.completeopt = { "menuone", "noselect" } -- mostly just for cmp
