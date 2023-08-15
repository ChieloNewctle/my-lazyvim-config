return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      autoformat = false,
    },
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    enabled = false,
  },
  {
    "mhartington/formatter.nvim",
    opts = function()
      return {
        filetype = {
          c = {
            require("formatter.filetypes.c").clangformat,
          },
          cpp = {
            require("formatter.filetypes.cpp").clangformat,
          },
          css = {
            require("formatter.filetypes.css").prettierd,
          },
          go = {
            require("formatter.filetypes.go").gofmt,
          },
          html = {
            require("formatter.filetypes.html").prettierd,
          },
          java = {
            require("formatter.filetypes.java").clangformat,
          },
          javascript = {
            require("formatter.filetypes.javascript").prettierd,
          },
          json = {
            require("formatter.filetypes.json").fixjson,
            require("formatter.filetypes.json").prettierd,
          },
          lua = {
            require("formatter.filetypes.lua").stylua,
          },
          markdown = {
            require("formatter.filetypes.markdown").prettierd,
          },
          python = {
            {
              exe = "black",
              args = { "-q", "-S", "-" },
              stdin = true,
            },
          },
          sh = {
            require("formatter.filetypes.sh").shfmt,
          },
          toml = {
            require("formatter.filetypes.toml").taplo,
          },
          yaml = {
            require("formatter.filetypes.yaml").prettierd,
          },
        }
      }
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "clang-format",
        "prettierd",
        "fixjson",
        "stylua",
        "black",
        "shfmt",
        "taplo",
      },
    },
  },
}
