-- TODO: use vim-fugitive

local function on_attach(bufnr)
  local gs = package.loaded.gitsigns

  -- Stage
  vim.keymap.set('n', '<leader>gs', gs.stage_hunk)
  vim.keymap.set('v', '<leader>gs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)

  -- Reset
  vim.keymap.set('n', '<leader>gr', gs.reset_hunk)
  vim.keymap.set('v', '<leader>gr', function() gs.reset_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
  vim.keymap.set('n', '<leader>gu', gs.undo_stage_hunk)

  -- Blame
  vim.keymap.set("n", "<leader>gb", gs.toggle_current_line_blame)
  vim.keymap.set('n', '<leader>gB', function() gs.blame_line { full = true } end)
end

--- @type LazyPluginSpec
local gitsigns_plugin = {
  "lewis6991/gitsigns.nvim",
  event = "VeryLazy",
  opts = {
    on_attach = on_attach,
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = 'eol',
      delay = 0,
      ignore_whitespace = false,
    },
  },
  config = function(_, opts)
    require("gitsigns").setup(opts)
  end,
}
return gitsigns_plugin
