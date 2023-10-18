local function prepend_formatter_args(condition, old_args, extra_args)
  if type(old_args) == "string" then
    old_args = { old_args }
  end
  if type(extra_args) == "string" then
    extra_args = { extra_args }
  end
  local function args(ctx)
    if condition() then
      if type(old_args) == "table" then
        return { unpack(extra_args), unpack(old_args) }
      end
      return { unpack(extra_args), unpack(old_args(ctx)) }
    end
    if type(old_args) == "table" then
      return { unpack(old_args) }
    end
    return { unpack(old_args(ctx)) }
  end
  return args
end

local default_python_formatter_opt = {
  use_darker_for_python = false,
  skip_string_literal = true,
}

require("conform.formatters.black").args = prepend_formatter_args(function()
  return require("neoconf").get("python_formatter", default_python_formatter_opt).skip_string_literal
end, require("conform.formatters.black").args, "-S")
require("conform.formatters.darker").args = prepend_formatter_args(function()
  return require("neoconf").get("python_formatter", default_python_formatter_opt).skip_string_literal
end, require("conform.formatters.darker").args, "-S")

return {
  {
    "stevearc/conform.nvim",
    dependencies = { "mason.nvim", "folke/neoconf.nvim" },
    opts = function()
      return {
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
