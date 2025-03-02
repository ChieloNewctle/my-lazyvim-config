return {
  {
    "stevearc/conform.nvim",
    -- dependencies = { "mason.nvim", "folke/neoconf.nvim" },
    opts = function()
      return {
        -- format = {
        --   timeout_ms = 3000,
        --   async = false, -- not recommended to change
        --   quiet = false, -- not recommended to change
        -- },
        formatters = {
          injected = { options = { ignore_errors = true } },
          rustfmt = {
            options = {
              -- The default edition of Rust to use when no Cargo.toml file is found
              default_edition = "2021",
            },
          },
          shfmt = { prepend_args = { "-i", "4" } },
        },
        formatters_by_ft = {
          c = { "clang_format" },
          cmake = { "gersemi" },
          cpp = { "clang_format" },
          css = { "prettier" },
          html = { "prettier" },
          javascript = { "prettier" },
          json = { "fixjson", "prettier" },
          lua = { "stylua" },
          markdown = { "prettier" },
          python = { "ruff_format" },
          rust = { "rustfmt" },
          sh = { "shfmt" },
          zsh = { "shfmt" },
          bash = { "shfmt" },
          typescript = { "prettier" },
          typescriptreact = { "prettier" },
          toml = { "taplo" },
          yaml = { "yamlfmt" },
        },
      }
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clang-format",
        "cmakelang",
        "fixjson",
        "gersemi",
        "prettier",
        "ruff",
        "shfmt",
        "stylua",
        "taplo",
        "yamlfmt",
      },
    },
  },
}
