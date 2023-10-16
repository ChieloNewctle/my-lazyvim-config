local function prepend_formatter_args(old_args, extra_args)
  if type(old_args) == "string" then
    old_args = { old_args }
  end
  if type(extra_args) == "string" then
    extra_args = { extra_args }
  end
  local function args(ctx)
    if type(old_args) == "table" then
      return { unpack(extra_args), unpack(old_args) }
    end
    return { unpack(extra_args), unpack(old_args(ctx)) }
  end
  return args
end

require("conform.formatters.black").args = prepend_formatter_args(require("conform.formatters.black").args, "-S")
require("conform.formatters.darker").args = prepend_formatter_args(require("conform.formatters.darker").args, "-S")

require("neoconf.plugins").register({
  name = "use_darker_for_python",
  on_schema = function(schema)
    schema:import("use_darker_for_python", { enabled = false })
  end,
})

require("conform").formatters_by_ft.c = { "clang_format" }
require("conform").formatters_by_ft.cpp = { "clang_format" }
require("conform").formatters_by_ft.css = { "prettier" }
require("conform").formatters_by_ft.html = { "prettier" }
require("conform").formatters_by_ft.javascript = { "prettier" }
require("conform").formatters_by_ft.json = { "fixjson", "prettier" }
require("conform").formatters_by_ft.lua = { "stylua" }
require("conform").formatters_by_ft.markdown = { "prettier" }
require("conform").formatters_by_ft.python =
  { require("neoconf").get("use_darker_for_python", { enabled = false }).enabled and "black" or "darker" }
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
        "darker",
        "shfmt",
        "taplo",
      },
    },
  },
}
