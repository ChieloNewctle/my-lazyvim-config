local default_python_formatter_opt = {
  use_darker_for_python = false,
  skip_string_literal = true,
}

return {
  {
    "stevearc/conform.nvim",
    dependencies = { "mason.nvim", "folke/neoconf.nvim" },
    opts = function()
      return {
        format = {
          timeout_ms = 3000,
          async = false, -- not recommended to change
          quiet = false, -- not recommended to change
        },
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
        },
        formatters_by_ft = {
          c = { "clang_format" },
          cpp = { "clang_format" },
          css = { "prettier" },
          html = { "prettier" },
          javascript = { "prettier" },
          json = { "fixjson", "prettier" },
          lua = { "stylua" },
          markdown = { "prettier" },
          python = {
            require("neoconf").get("python_formatter", default_python_formatter_opt).use_darker_for_py and "darker"
              or "black",
          },
          sh = { "shfmt" },
          typescript = { "prettier" },
          typescriptreact = { "prettier" },
          toml = { "taplo" },
          yaml = { "prettier" },
        },
      }
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clang-format",
        "prettier",
        "fixjson",
        "stylua",
        "black",
        "darker",
        "shfmt",
        "taplo",
      },
    },
  },
}
