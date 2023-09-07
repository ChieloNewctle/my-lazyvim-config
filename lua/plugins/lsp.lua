return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      autoformat = false,
    },
    init = function()
      local keys = require("lazyvim.plugins.lsp.keymaps").get()
      keys[#keys + 1] = { "<leader>cf", false }
    end,
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
            require("formatter.filetypes.css").prettier,
          },
          -- go = {
          --   require("formatter.filetypes.go").gofmt,
          -- },
          html = {
            require("formatter.filetypes.html").prettier,
          },
          -- java = {
          --   require("formatter.filetypes.java").clangformat,
          -- },
          javascript = {
            require("formatter.filetypes.javascript").prettier,
          },
          json = {
            require("formatter.filetypes.json").fixjson,
            require("formatter.filetypes.json").prettier,
          },
          lua = {
            require("formatter.filetypes.lua").stylua,
          },
          markdown = {
            require("formatter.filetypes.markdown").prettier,
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
          typescript = {
            require("formatter.filetypes.typescript").prettier,
          },
          typescriptreact = {
            require("formatter.filetypes.typescriptreact").prettier,
          },
          toml = {
            require("formatter.filetypes.toml").taplo,
          },
          yaml = {
            require("formatter.filetypes.yaml").prettier,
          },
          ["*"] = {
            require("formatter.filetypes.any").remove_trailing_whitespace,
            function()
              -- Ignore already configured types.
              local defined_types = require("formatter.config").values.filetype
              if defined_types[vim.bo.filetype] ~= nil then
                return nil
              end
              vim.lsp.buf.format({ async = true })
            end,
          },
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
        "shfmt",
        "taplo",
      },
    },
  },
}
