local default_python_formatter_opt = {
  use_darker_for_python = false,
  skip_string_literal = true,
}

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
          black = {
            prepend_args = require("neoconf").get("python_formatter", default_python_formatter_opt).skip_string_literal
                and { "-S" }
              or {},
          },
          darker = {
            prepend_args = require("neoconf").get("python_formatter", default_python_formatter_opt).skip_string_literal
                and { "-S" }
              or {},
          },
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
          python = {
            "ruff",
            require("neoconf").get("python_formatter", default_python_formatter_opt).use_darker_for_py and "darker"
              or "black",
          },
          rust = { "rustfmt" },
          sh = { "shfmt" },
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
        "black",
        "clang-format",
        "cmakelang",
        "darker",
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
