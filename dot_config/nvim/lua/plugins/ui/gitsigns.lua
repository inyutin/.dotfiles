local function on_attach(bufnr)
  local gs = package.loaded.gitsigns

  vim.keymap.set('n', '<leader>hs', gs.stage_hunk)
  vim.keymap.set('v', '<leader>hs', function() gs.stage_hunk { vim.fn.line('.'), vim.fn.line('v') } end)
  vim.keymap.set('n', '<leader>hu', gs.undo_stage_hunk)
  vim.keymap.set("n", "<leader>tb", gs.toggle_current_line_blame)
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
