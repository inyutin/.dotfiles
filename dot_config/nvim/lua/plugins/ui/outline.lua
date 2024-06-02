local outline_plugin = {
  "hedyhli/outline.nvim",
  lazy = true,
  cmd = { "Outline", "OutlineOpen" },
  keys = {
    { "<leader>to", "<cmd>Outline!<CR>", desc = "Toggle outline" },
  },
  opts = {
    outline_window = {
      show_numbers = true,
      show_relative_numbers = true,
    },
    preview_window = {
      auto_preview = true,
    },
  },
}
return outline_plugin
