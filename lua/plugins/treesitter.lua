return {
  {
    "yioneko/nvim-yati",
    dependencies = { "nvim-treesitter/nvim-treesitter" },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opt = {
      indent = {
        enable = false,
        disable = true,
      },
      yati = {
        enable = true,
        default_lazy = true,
        default_fallback = "auto",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter-context",
  },
}
