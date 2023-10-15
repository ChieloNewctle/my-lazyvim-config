return {
  "0x00-ketsu/autosave.nvim",
  lazy = false,
  config = function()
    require("autosave").setup({
      enable = true,
    })
  end,
}
