return {
  {
    "nvim-lspconfig",
    opts = {
      inlay_hints = {
        enabled = true,
      },
      servers = {
        yamlls = {
          settings = {
            yaml = {
              format = { enable = false },
            },
          },
        },
      },
    },
  },
}
