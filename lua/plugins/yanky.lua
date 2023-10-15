return {
  {
    "gbprod/yanky.nvim",
    dependencies = {
      { "kkharji/sqlite.lua", enabled = false },
    },
    opts = {
      highlight = { timer = 250 },
      ring = { storage = "shada" },
      preserve_cursor_position = { enabled = true },
    },
  },
}
