return {
  "0x00-ketsu/autosave.nvim",
  config = function()
    require("autosave").setup({
      enable = true,
      prompt_style = "notify",
    })
  end,
}
