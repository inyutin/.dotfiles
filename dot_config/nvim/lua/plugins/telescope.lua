-- https://github.com/nvim-telescope/telescope.nvim/issues/2104
local find_lsp_classes = function()
  local symbol_opts = {
    symbols = {
      "class",
    }
  }
  require('telescope.builtin').lsp_dynamic_workspace_symbols(symbol_opts)
end

-- TODO: set up more staff for telescope
--- @type LazyPluginSpec
local telescope_plugin = {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    {
      "debugloop/telescope-undo.nvim",
    },
  },
  config = function(_, _)
    require('telescope').setup({
      extensions = { undo = {} },
      defaults = {
        mappings = {
          n = {
            ['<c-d>'] = require('telescope.actions').delete_buffer
          },
          i = {
            ['<c-d>'] = require('telescope.actions').delete_buffer
          },
        },
      },
    })
    require("telescope").load_extension("undo")

    local keymaps_opts = { noremap = true, silent = true }
    vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", keymaps_opts)
    vim.keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", keymaps_opts)
    vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", keymaps_opts)
    vim.keymap.set("n", "<leader>fr", "<cmd>Telescope resume<cr>", keymaps_opts)
    vim.keymap.set("n", "<leader>fq", "<cmd>Telescope quickfix<cr>", keymaps_opts)
    vim.keymap.set("n", "<leader>fh", "<cmd>Telescope quickfixhistory<cr>", keymaps_opts)
    vim.keymap.set("n", "<leader>fu", "<cmd>Telescope undo<cr>", keymaps_opts)
    vim.keymap.set("n", "<leader>flc", find_lsp_classes, keymaps_opts)
  end,
}
return telescope_plugin
