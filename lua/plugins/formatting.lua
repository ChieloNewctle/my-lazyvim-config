require("conform.formatters.black").args = {
  "-S",
  "--stdin-filename",
  "$FILENAME",
  "--quiet",
  "-",
}

require("conform").formatters_by_ft.c = { "clang_format" }
require("conform").formatters_by_ft.cpp = { "clang_format" }
require("conform").formatters_by_ft.css = { "prettier" }
require("conform").formatters_by_ft.html = { "prettier" }
require("conform").formatters_by_ft.javascript = { "prettier" }
require("conform").formatters_by_ft.json = { "fixjson", "prettier" }
require("conform").formatters_by_ft.lua = { "stylua" }
require("conform").formatters_by_ft.markdown = { "prettier" }
require("conform").formatters_by_ft.python = { "black" }
require("conform").formatters_by_ft.sh = { "shfmt" }
require("conform").formatters_by_ft.typescript = { "prettier" }
require("conform").formatters_by_ft.typescriptreact = { "prettier" }
require("conform").formatters_by_ft.toml = { "taplo" }
require("conform").formatters_by_ft.yaml = { "prettier" }

return {
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clang-format",
        "prettier",
        "fixjson",
        "stylua",
        "black",
        "shfmt",
        "taplo",
      },
    },
  },
}
