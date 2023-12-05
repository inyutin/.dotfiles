local outline_plugin = {
  "hedyhli/outline.nvim",
  commit = "dd536ac0bdd9d68c5d0d9ae1bb33356f18567197",
  lazy = true,
  cmd = { "Outline", "OutlineOpen" },
  keys = {
    { "<leader>to", "<cmd>Outline[!]<CR>", desc = "Toggle outline" },
  },
  opts = {},
}

return outline_plugin
