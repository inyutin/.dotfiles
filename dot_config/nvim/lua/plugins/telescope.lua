-- https://github.com/nvim-telescope/telescope.nvim/issues/2104
local find_lsp_classes = function()
  local symbol_opts = {
    symbols = {
      "class",
    }
  }
  require('telescope.builtin').lsp_dynamic_workspace_symbols(symbol_opts)
end

-- TODO set up https://github.com/nvim-telescope/telescope-smart-history.nvim
-- TODO set up more telescope extensions

--- @type LazyPluginSpec
local telescope_plugin = {
  "nvim-telescope/telescope.nvim",
  config = function(_, _)
    local telescope = require('telescope')
    local actions = require('telescope.actions')

    telescope.setup({
      defaults = {
        mappings = {
          n = {
            ['<C-d>'] = actions.delete_buffer
          },
          i = {
            ['<C-d>'] = actions.delete_buffer,
            ["<C-n>"] = actions.cycle_history_next,
            ["<C-p>"] = actions.cycle_history_prev,
          },
        },
      },
    })

    local keymaps_opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", keymaps_opts)
    vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", keymaps_opts)
    vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", keymaps_opts)
    vim.keymap.set("n", "<leader>fr", "<cmd>Telescope resume<cr>", keymaps_opts)
    vim.keymap.set("n", "<leader>fq", "<cmd>Telescope quickfix<cr>", keymaps_opts)
    vim.keymap.set("n", "<leader>fG", "<cmd>Telescope git_status<cr>", keymaps_opts)
    vim.keymap.set("n", "<leader>flc", find_lsp_classes, keymaps_opts)
  end,
}
return telescope_plugin
