local function jupynium_set_keymaps(buf_id)
  vim.keymap.set(
    { "n", "x" },
    "<space>jx",
    "<cmd>JupyniumExecuteSelectedCells<CR>",
    { buffer = buf_id, desc = "Jupynium execute selected cells" }
  )
  vim.keymap.set(
    { "n", "x" },
    "<space>jc",
    "<cmd>JupyniumClearSelectedCellsOutputs<CR>",
    { buffer = buf_id, desc = "Jupynium clear selected cells" }
  )
  vim.keymap.set(
    { "n" },
    "<space>jK",
    "<cmd>JupyniumKernelHover<cr>",
    { buffer = buf_id, desc = "Jupynium hover (inspect a variable)" }
  )
  vim.keymap.set(
    { "n", "x" },
    "<space>js",
    "<cmd>JupyniumScrollToCell<cr>",
    { buffer = buf_id, desc = "Jupynium scroll to cell" }
  )
  vim.keymap.set(
    { "n", "x" },
    "<space>jo",
    "<cmd>JupyniumToggleSelectedCellsOutputsScroll<cr>",
    { buffer = buf_id, desc = "Jupynium toggle selected cell output scroll" }
  )
  -- vim.keymap.set("", "<PageUp>", "<cmd>JupyniumScrollUp<cr>", { buffer = buf_id, desc = "Jupynium scroll up" })
  -- vim.keymap.set("", "<PageDown>", "<cmd>JupyniumScrollDown<cr>", { buffer = buf_id, desc = "Jupynium scroll down" })
end

return {
  {
    "kiyoon/jupynium.nvim",
    enabled = vim.fn.isdirectory(vim.fn.expand "~/miniforge3/envs/jupynium"),
    build = "mamba run --no-capture-output -n jupynium pip install .",
    event = "BufWinEnter *.ju.py",
    config = function()
      local jupynium = require("jupynium")
      jupynium.setup({
        python_host = { "mamba", "run", "--no-capture-output", "-n", "jupynium", "python" },
        -- default_notebook_URL = "http://127.0.0.1:20080/nbclassic",
        use_default_keybindings = false,
        auto_start_server = { enabled = true },
      })
      vim.api.nvim_create_autocmd({ "BufEnter" }, {
        pattern = "*.ju.py",
        callback = function(event)
          jupynium_set_keymaps(event.buf)
        end,
      })
    end,
  },
}
