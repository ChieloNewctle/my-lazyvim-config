return {
  {
    "L3MON4D3/LuaSnip",
    enabled = false,
  },
  {
    "saadparwaiz1/cmp_luasnip",
    enabled = false,
  },
  {
    "rafamadriz/friendly-snippets",
    enabled = false,
  },
  {
    "dcampos/nvim-snippy",
    keys = {
      { "<Tab>", mode = { "i", "s" } },
      { "<S-Tab>", mode = { "i", "s" } },
    },
    ft = "snippets",
    cmd = { "SnippyEdit", "SnippyReload" },
    opts = {
      mappings = {
        is = {
          ["<Tab>"] = "expand_or_advance",
          ["<S-Tab>"] = "previous",
        },
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      "dcampos/nvim-snippy",
    },
    config = function(_, opts)
      local cmp = require("cmp")
      opts.snippet = {
        expand = function(args)
          require("snippy").expand_snippet(args.body)
        end,
      }
      opts.sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "snippy" },
        { name = "path" },
      }, {
        { name = "buffer" },
      })
      for _, source in ipairs(opts.sources) do
        source.group_index = source.group_index or 1
      end
      require("cmp").setup(opts)
    end,
  },
}
